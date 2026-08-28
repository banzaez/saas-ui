import 'dart:convert';
import '../models/log_json_models.dart';

TokenizationResult processJsonInIsolate(Map<String, dynamic> params) {
  final String jsonStr = params['json'] as String;
  final String? query = params['query'] as String?;

  if (jsonStr.isEmpty) return TokenizationResult('', [], [], []);

  final List<JsonLine> lines = [];
  final List<int> matchLineIndices = [];
  final List<ExtractedFile> extractedFiles = [];
  List<JsonToken> currentLineTokens = [];
  int currentLineNumber = 0;

  // Рекурсивный поиск файлов в структуре
  void findFiles(dynamic data) {
    if (data is Map) {
      if (data.containsKey('files') && data['files'] is List) {
        for (var f in data['files']) {
          if (f is Map && f.containsKey('base64') && f['base64'] is String) {
            extractedFiles.add(
              ExtractedFile(
                name: f['name']?.toString() ?? 'file_${extractedFiles.length}',
                base64: f['base64'].toString(),
                type: f['type']?.toString(),
                size: double.tryParse(f['size']?.toString() ?? ''),
              ),
            );
          }
        }
      }
      data.forEach((key, value) => findFiles(value));
    } else if (data is List) {
      for (var item in data) {
        findFiles(item);
      }
    }
  }

  String formatted;
  try {
    final dynamic decoded = json.decode(jsonStr);
    findFiles(decoded); // Ищем файлы
    formatted = const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    formatted = jsonStr;
  }

  final syntaxRegex = RegExp(
    r'("(?:[^"\\]|\\.)*"\s*:)|("(?:[^"\\]|\\.)*(?:"|$))|(-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)|(true|false|null)',
  );
  final dataUriRegex = RegExp(r'data:[^;]+;base64,');
  final List<RegExpMatch> syntaxMatches = syntaxRegex
      .allMatches(formatted)
      .toList();
  int syntaxIdx = 0;

  final lowerText = formatted.toLowerCase();
  final lowerQuery = query?.toLowerCase() ?? '';
  final List<int> searchIndices = [];
  if (lowerQuery.isNotEmpty) {
    int sPos = lowerText.indexOf(lowerQuery);
    while (sPos != -1) {
      searchIndices.add(sPos);
      sPos = lowerText.indexOf(lowerQuery, sPos + lowerQuery.length);
    }
  }
  int searchIdx = 0;

  String lastKeyText = '';
  int pos = 0;
  while (pos < formatted.length) {
    int nextPoint = formatted.length;

    // Syntax boundary
    JsonTokenType type = JsonTokenType.normal;
    if (syntaxIdx < syntaxMatches.length) {
      final m = syntaxMatches[syntaxIdx];
      if (pos >= m.start && pos < m.end) {
        nextPoint = m.end;
        final t = m.group(0)!;
        if (t.trim().endsWith(':')) {
          type = JsonTokenType.key;
        } else if (t.startsWith('"')) {
          final bool isBase64ByKey =
              lastKeyText.contains('base64') || lastKeyText.contains('image');

          if (isBase64ByKey || dataUriRegex.hasMatch(t)) {
            type = JsonTokenType.base64;
          } else {
            type = JsonTokenType.string;
          }
        } else if (t == 'true' || t == 'false') {
          type = JsonTokenType.boolean;
        } else if (t == 'null') {
          type = JsonTokenType.nullValue;
        } else {
          type = JsonTokenType.number;
        }
      } else if (m.start > pos && m.start < nextPoint) {
        nextPoint = m.start;
      }
    }

    // Search boundary
    bool isMatch = false;
    int? matchIdx;
    if (type != JsonTokenType.base64 && searchIdx < searchIndices.length) {
      final sStart = searchIndices[searchIdx];
      final sEnd = sStart + lowerQuery.length;
      if (pos >= sStart && pos < sEnd) {
        isMatch = true;
        matchIdx = searchIdx;
        if (sEnd < nextPoint) nextPoint = sEnd;
        if (pos == sStart) matchLineIndices.add(currentLineNumber);
      } else if (sStart > pos && sStart < nextPoint) {
        nextPoint = sStart;
      }
    }

    // Newline boundary
    final int firstNewline = formatted.indexOf('\n', pos);
    if (firstNewline != -1 && firstNewline < nextPoint) {
      nextPoint = firstNewline + 1; // Content + newline
    }

    final String text = formatted.substring(pos, nextPoint);
    if (type == JsonTokenType.key) lastKeyText = text.toLowerCase();

    // Add token to current line
    if (currentLineTokens.isNotEmpty &&
        currentLineTokens.last.type == type &&
        currentLineTokens.last.isMatch == isMatch &&
        currentLineTokens.last.matchIndex == matchIdx) {
      currentLineTokens[currentLineTokens.length - 1] = JsonToken(
        currentLineTokens.last.text + text,
        isMatch: isMatch,
        matchIndex: matchIdx,
        type: type,
      );
    } else {
      currentLineTokens.add(
        JsonToken(text, isMatch: isMatch, matchIndex: matchIdx, type: type),
      );
    }

    // If we just added a newline, finish this line
    if (text.endsWith('\n')) {
      // Убираем сам символ \n из токена для отображения,
      // так как ListView и так переносит элементы.
      if (currentLineTokens.isNotEmpty) {
        final lastToken = currentLineTokens.last;
        if (lastToken.text.endsWith('\n')) {
          currentLineTokens[currentLineTokens.length - 1] = JsonToken(
            lastToken.text.substring(0, lastToken.text.length - 1),
            isMatch: lastToken.isMatch,
            matchIndex: lastToken.matchIndex,
            type: lastToken.type,
          );
        }
      }
      lines.add(JsonLine(currentLineTokens, currentLineNumber));
      currentLineTokens = [];
      currentLineNumber++;
    }

    pos = nextPoint;
    while (syntaxIdx < syntaxMatches.length &&
        syntaxMatches[syntaxIdx].end <= pos) {
      syntaxIdx++;
    }
    while (searchIdx < searchIndices.length &&
        (searchIndices[searchIdx] + lowerQuery.length) <= pos) {
      searchIdx++;
    }
  }
  if (currentLineTokens.isNotEmpty) {
    lines.add(JsonLine(currentLineTokens, currentLineNumber));
  }
  return TokenizationResult(formatted, lines, matchLineIndices, extractedFiles);
}
