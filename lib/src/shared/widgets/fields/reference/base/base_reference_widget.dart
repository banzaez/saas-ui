import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_list.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/base/base_reference_choice_list.dart';

abstract class BaseReferenceWidget<T extends BaseModel>
    extends ConsumerStatefulWidget {
  const BaseReferenceWidget({
    super.key,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.initialValue,
    this.enabled = true,
    this.showClearButton = false,
    this.validator,
  });

  final ValueChanged<T?>? onChanged;
  final InputDecoration decoration;
  final int? initialValue;
  final bool enabled;
  final bool showClearButton;
  final FormFieldValidator<T?>? validator;

  Future<List<T>> getItems(WidgetRef ref);

  /// Возвращает виджет формы создания нового элемента.
  /// Вызывается лениво — только при нажатии кнопки "Создать новый".
  /// Переопределяй вместе с [supportsCreate].
  Widget? buildEditPanel(BuildContext context) => null;

  /// Показывать ли кнопку "Создать новый" в диалоге.
  /// Переопредели в `true` если реализуешь [buildEditPanel].
  bool get supportsCreate => false;

  @override
  ConsumerState<BaseReferenceWidget<T>> createState() =>
      _BaseReferenceWidgetState<T>();
}

class _BaseReferenceWidgetState<T extends BaseModel>
    extends ConsumerState<BaseReferenceWidget<T>> {
  final _formFieldKey = GlobalKey<FormFieldState<T>>();
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<T> _items = [];
  T? _selectedItem;
  int _highlightedIndex = 0;

  /// true во время начальной загрузки при initState
  bool _isLoading = true;

  /// true пока обновляем список перед открытием диалога
  bool _isOpening = false;

  bool get _isBusy => _isLoading || _isOpening;

  /// Фильтрация элементов по поиску
  List<T> _searchItems(String query, {int? take}) {
    final q = query.toLowerCase();
    final matches = _items.where(
      (item) =>
          item.getName.toLowerCase().contains(q) ||
          item.id.toString().contains(q),
    );
    return take != null ? matches.take(take).toList() : matches.toList();
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _selectedItem != null) {
        _textController.text = _selectedItem!.getName;
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BaseReferenceWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _loadItems();
    }
  }

  Future<void> _loadItems() async {
    setState(() => _isLoading = true);

    final List<T> items = await widget.getItems(ref);
    final T? value = _findInitialValue(items);

    if (mounted) {
      _updateStateAfterLoad(items, value);
    }
  }

  /// Поиск начального значения
  T? _findInitialValue(List<T> items) {
    if (widget.initialValue == null) return null;
    return items.firstWhereOrNull(
      (element) => element.id == widget.initialValue,
    );
  }

  /// Обновление состояния после загрузки
  void _updateStateAfterLoad(List<T> items, T? value) {
    setState(() {
      _items = items;
      _selectedItem = value;
      _isLoading = false;
      if (value != null) {
        _textController.text = value.getName;
      }
    });
    if (value != null) {
      _formFieldKey.currentState?.didChange(value);
    }
  }

  @override
  Widget build(BuildContext context) => FormField<T>(
    key: _formFieldKey,
    validator: widget.validator,
    builder: (FormFieldState<T> state) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return RawAutocomplete<T>(
            textEditingController: _textController,
            focusNode: _focusNode,
            displayStringForOption: (option) => option.getName,
            optionsBuilder: _buildOptionsFilter,
            onSelected: (T selection) {
              _onItemSelected(state, selection);
            },
            fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
              return _buildTextField(state, controller, focusNode, onSubmitted);
            },
            optionsViewBuilder: (context, onSelected, options) {
              return _buildOptionsView(
                context,
                onSelected,
                options,
                constraints.maxWidth,
              );
            },
          );
        },
      );
    },
  );

  /// Построитель фильтра опций для Autocomplete
  Iterable<T> _buildOptionsFilter(TextEditingValue textEditingValue) {
    final query = textEditingValue.text.toLowerCase();
    return _searchItems(query);
  }

  /// Построение поля ввода
  Widget _buildTextField(
    FormFieldState<T> state,
    TextEditingController controller,
    FocusNode focusNode,
    VoidCallback onSubmitted,
  ) {
    return CallbackShortcuts(
      bindings: _buildShortcuts(controller),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: widget.enabled && !_isBusy,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: widget.enabled ? null : AppColors.disable,
        ),
        decoration: widget.decoration.copyWith(
          errorText: state.errorText,
          prefixIcon: _buildFieldPrefix(),
          suffixIcon: _buildSuffixIcons(state),
        ),
        onSubmitted: (value) => _onFieldSubmitted(state, value, onSubmitted),
      ),
    );
  }

  /// Построение обработчиков горячих клавиш
  Map<ShortcutActivator, VoidCallback> _buildShortcuts(
    TextEditingController controller,
  ) {
    return {
      const SingleActivator(LogicalKeyboardKey.arrowDown): () {
        final query = controller.text.toLowerCase();
        final count = _searchItems(query, take: 5).length;
        if (count > 0) {
          setState(() {
            _highlightedIndex = (_highlightedIndex + 1) % count;
          });
        }
      },
      const SingleActivator(LogicalKeyboardKey.arrowUp): () {
        final query = controller.text.toLowerCase();
        final count = _searchItems(query, take: 5).length;
        if (count > 0) {
          setState(() {
            _highlightedIndex = (_highlightedIndex - 1 + count) % count;
          });
        }
      },
    };
  }

  /// Обработчик отправки поля
  void _onFieldSubmitted(
    FormFieldState<T> state,
    String value,
    VoidCallback onSubmitted,
  ) {
    final query = value.toLowerCase();
    final matches = _searchItems(query, take: 5);
    if (matches.isNotEmpty) {
      final index = _highlightedIndex < matches.length ? _highlightedIndex : 0;
      _onItemSelected(state, matches[index]);
      _focusNode.unfocus();
    } else {
      onSubmitted();
    }
  }

  /// Построение представления списка опций
  Widget _buildOptionsView(
    BuildContext context,
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
    double fieldWidth,
  ) {
    final query = _textController.text.toLowerCase();
    final allMatches = _searchItems(query);
    final currentOptions = options.take(5);

    // Сброс индекса, если он вышел за границы текущего списка
    if (_highlightedIndex >= currentOptions.length) {
      _highlightedIndex = 0;
    }

    return _buildOptions(
      context,
      onSelected,
      currentOptions,
      fieldWidth,
      allMatches.length,
      highlightedIndex: _highlightedIndex,
    );
  }

  Widget? _buildFieldPrefix() {
    if (_selectedItem == null) return null;

    // Показываем ID только если текст в поле совпадает с выбранным элементом
    // (т.е. пользователь не начал новый поиск)
    if (_textController.text != _selectedItem!.getName) return null;

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 4),
      child: UnconstrainedBox(child: _buildIdBadge(_selectedItem!)),
    );
  }

  Widget _buildSuffixIcons(FormFieldState<T> state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isOpening)
          _buildLoadingIndicator()
        else ...[
          if (_buildClearButton(state) != null) _buildClearButton(state)!,
          _buildOpenButton(state),
        ],
        const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildLoadingIndicator() => const Padding(
    padding: EdgeInsets.all(12),
    child: SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.primary,
      ),
    ),
  );

  Widget? _buildClearButton(FormFieldState<T> state) {
    if (!widget.showClearButton || _selectedItem == null) return null;

    return IconButton(
      onPressed: () => _onClear(state),
      icon: Icon(
        Icons.cancel_rounded,
        size: 18,
        color: AppColors.textGrey.withValues(alpha: .5),
      ),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }

  Widget _buildOpenButton(FormFieldState<T> state) => IconButton(
    onPressed: () => _onTap(state),
    icon: const Icon(Icons.list_alt_rounded, size: 20),
    splashRadius: 20,
    color: AppColors.primary,
  );

  Widget _buildOptions(
    BuildContext context,
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
    double fieldWidth,
    int totalCount, {
    int highlightedIndex = 0,
  }) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: fieldWidth,
          constraints: const BoxConstraints(maxHeight: 340),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: Colors.grey.withValues(alpha: .2)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionsList(context, onSelected, options, highlightedIndex),
              _buildOptionsFooter(options.length, totalCount),
            ],
          ),
        ),
      ),
    );
  }

  /// Список опций с прокруткой
  Widget _buildOptionsList(
    BuildContext context,
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
    int highlightedIndex,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 4),
      shrinkWrap: true,
      itemCount: options.length,
      separatorBuilder: (_, _) =>
          Divider(height: 1, color: Colors.grey.withValues(alpha: .05)),
      itemBuilder: (context, index) {
        final T option = options.elementAt(index);
        final isHighlighted = index == highlightedIndex;
        return InkWell(
          onTap: () => onSelected(option),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            color: isHighlighted
                ? AppColors.primary.withValues(alpha: .06)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _buildIdBadge(option),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    option.getName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isHighlighted ? AppColors.primary : null,
                    ),
                  ),
                ),
                if (isHighlighted)
                  const Icon(
                    Icons.keyboard_return_rounded,
                    size: 14,
                    color: AppColors.primary,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Подвал со счетчиком опций
  Widget _buildOptionsFooter(int shownCount, int totalCount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .03),
        border: Border(
          top: BorderSide(color: Colors.grey.withValues(alpha: .1)),
        ),
      ),
      child: Text(
        'Показано $shownCount из $totalCount',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.textGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildIdBadge(T item) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: .08),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      '${item.id}',
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    ),
  );

  // ==> Работа с событиями

  Future<void> _onTap(FormFieldState<T> state) async {
    _focusNode.unfocus();
    final T? item = await _showDialog();
    if (item != null && mounted) {
      _onItemSelected(state, item);
    }
  }

  void _onItemSelected(FormFieldState<T> state, T item) {
    setState(() {
      _selectedItem = item;
      _textController.text = item.getName;
    });
    state.didChange(item);
    widget.onChanged?.call(item);
  }

  void _onClear(FormFieldState<T> state) {
    setState(() {
      _selectedItem = null;
      _textController.clear();
    });
    state.didChange(null);
    widget.onChanged?.call(null);
  }

  // ==> Работа с диалогом

  Future<T?> _showDialog() async {
    setState(() => _isOpening = true);
    final List<T> freshItems = await widget.getItems(ref);
    if (!mounted) return null;

    _updateStateAfterRefresh(freshItems);
    return _showDialogBuilder();
  }

  /// Обновление состояния после обновления списка
  void _updateStateAfterRefresh(List<T> freshItems) {
    setState(() {
      _items = freshItems;
      _isOpening = false;
    });
  }

  /// Построитель диалога
  Future<T?> _showDialogBuilder() {
    return showDialog<T>(
      context: context,
      builder: (context) => BaseReferenceChoiceList<T>(
        onCreate: _onCreateItem,
        selectedItem: _selectedItem,
        items: _items,
        buildEditPanel: widget.supportsCreate ? widget.buildEditPanel : null,
      ),
    );
  }

  /// Обработчик создания нового элемента
  Future<void> _onCreateItem(T? created) async {
    final List<T> items = await widget.getItems(ref);
    if (mounted) setState(() => _items = items);
  }
}
