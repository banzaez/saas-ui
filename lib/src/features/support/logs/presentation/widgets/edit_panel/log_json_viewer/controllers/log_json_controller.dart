import 'dart:async';
import 'dart:convert';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';
import '../models/log_json_models.dart';
import '../utils/log_json_logic.dart';
import '../styles/log_json_styles.dart';
import '../widgets/log_json_base64_badge.dart';

class LogJsonController extends ChangeNotifier {
  bool _isExpanded = false;
  bool _isActive = false;
  List<ExtractedFile> _extractedFiles = [];
  bool _isProcessing = false;
  String _searchQuery = '';
  int _currentMatchIndex = 0;
  int _totalMatches = 0;
  TokenizationResult? _tokenizationResult;
  Future<TokenizationResult>? _futureResult;

  String _currentJson = '';
  String formattedJson = '';
  List<int> _matchLineIndices = [];
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  Timer? _searchDebounce;

  bool get isExpanded => _isExpanded;
  bool get isActive => _isActive;
  List<ExtractedFile> get extractedFiles =>
      List<ExtractedFile>.unmodifiable(_extractedFiles);
  bool get isProcessing => _isProcessing;
  String get searchQuery => _searchQuery;
  int get currentMatchIndex => _currentMatchIndex;
  int get totalMatches => _totalMatches;
  TokenizationResult? get tokenizationResult => _tokenizationResult;
  Future<TokenizationResult>? get futureResult => _futureResult;

  Future<void> updateData(String jsonString) async {
    if (_currentJson == jsonString && _futureResult != null) return;
    _currentJson = jsonString;
    await _startProcessing();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void setExpanded(bool value) {
    if (_isExpanded == value) return;
    _isExpanded = value;
    notifyListeners();
  }

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void setActive(bool active) {
    if (_isActive == active) return;
    _isActive = active;
    notifyListeners();
  }

  Future<void> updateSearch(String query) async {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      _searchQuery = query;
      notifyListeners();
      await _startProcessing();
      if (_totalMatches > 0) {
        jumpToMatch(0);
      }
    });
  }

  Future<void> clearSearch() async {
    searchController.clear();
    await updateSearch('');
  }

  void nextMatch() {
    if (_totalMatches == 0) return;
    final nextIndex = (_currentMatchIndex + 1) % _totalMatches;
    jumpToMatch(nextIndex);
  }

  void previousMatch() {
    if (_totalMatches == 0) return;
    final prevIndex = (_currentMatchIndex - 1 + _totalMatches) % _totalMatches;
    jumpToMatch(prevIndex);
  }

  void jumpToMatch(int index) {
    if (index < 0 || index >= _matchLineIndices.length) return;
    _currentMatchIndex = index;
    notifyListeners();

    final lineIndex = _matchLineIndices[index];
    if (scrollController.hasClients) {
      const double approximateLineHeight = 13.0 * 1.5;
      scrollController.animateTo(
        lineIndex * approximateLineHeight,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _startProcessing() async {
    _isProcessing = true;
    notifyListeners();

    final future = compute(processJsonInIsolate, {
      'json': _currentJson,
      'query': _searchQuery,
    });

    _futureResult = future;
    notifyListeners();

    final result = await future;
    formattedJson = result.formattedJson;
    _matchLineIndices = result.matchLineIndices;
    _totalMatches = _matchLineIndices.length;
    _currentMatchIndex = 0;
    _tokenizationResult = result;
    _extractedFiles = List<ExtractedFile>.from(result.files);
    _isProcessing = false;
    notifyListeners();
  }

  Future<void> downloadFile(ExtractedFile file) async {
    try {
      String base64Data = file.base64;
      if (base64Data.contains(',')) {
        base64Data = base64Data.split(',')[1];
      }
      base64Data = base64Data.replaceAll(RegExp(r'\s+'), '');

      final Uint8List bytes = base64Decode(base64Data);

      final String fileNameOnly = file.name.contains('.')
          ? file.name.substring(0, file.name.lastIndexOf('.'))
          : file.name;
      final String extension =
          file.type ??
          (file.name.contains('.') ? file.name.split('.').last : '');

      final String fullName = extension.isNotEmpty
          ? (fileNameOnly.endsWith('.$extension')
                ? fileNameOnly
                : '$fileNameOnly.$extension')
          : fileNameOnly;

      await FileSaver.instance.saveFile(name: fullName, bytes: bytes);

      AppSnackbar.showSuccess(
        title: 'Успешно',
        message: 'Файл "${file.name}" сохранен',
      );
    } catch (e) {
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Не удалось сохранить файл: $e',
      );
    }
  }

  TextSpan buildLineSpan(BuildContext context, List<JsonToken> tokens) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final baseStyle = LogJsonStyles.getBaseStyle(isDark);
    final typeStyles = LogJsonStyles.getTypeStyles(isDark);

    final Color activeMatchBg = LogJsonStyles.getActiveMatchBg();
    final Color passiveMatchBg = LogJsonStyles.getPassiveMatchBg();
    final int activeIdx = _currentMatchIndex;

    final List<InlineSpan> children = [];

    for (int i = 0; i < tokens.length; i++) {
      final token = tokens[i];

      if (token.type == JsonTokenType.base64 && !token.isMatch) {
        children.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: LogJsonBase64Badge(text: token.text),
          ),
        );
        continue;
      }

      if (token.isMatch) {
        final bool isActiveMatch = token.matchIndex == activeIdx;
        children.add(
          TextSpan(
            text: token.text,
            style: baseStyle.copyWith(
              backgroundColor: isActiveMatch ? activeMatchBg : passiveMatchBg,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        );
        continue;
      }

      children.add(
        TextSpan(text: token.text, style: typeStyles[token.type] ?? baseStyle),
      );
    }

    return TextSpan(children: children);
  }

  Future<void> copyToClipboard() => ClipboardHelper.copy(formattedJson);
}
