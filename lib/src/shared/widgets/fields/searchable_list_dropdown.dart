import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

/// Виджет выпадающего списка с поиском в реальном времени.
///
/// Принимает заранее загруженный список [items].
/// Каждый элемент представлен через [SearchableItem]:
///  - [id] — числовой идентификатор (показывается как бейдж, ищется по нему)
///  - [label] — отображаемое название (ищется по нему)
///  - [value] — исходное значение типа [T]
///
/// Поддерживает:
///  - Живую фильтрацию по id и label
///  - Навигацию по списку клавишами ↑/↓ и выбор по Enter
///  - Кнопку очистки
///  - Вывод ID бейджа у выбранного элемента
class SearchableListDropdown<T> extends StatefulWidget {
  const SearchableListDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint = '',
    this.label = '',
    this.initialValue,
    this.showClearButton = true,
    this.decoration = const InputDecoration(),
    this.validator,
    this.enabled = true,
    this.isLoading = false,
  });

  /// Список элементов для отображения.
  final List<SearchableItem<T>> items;

  /// Вызывается при выборе/очистке элемента.
  final ValueChanged<T?> onChanged;

  /// Подсказка в пустом поле.
  final String hint;

  /// Лейбл поля (floating label).
  final String label;

  /// Начальное значение (по id элемента).
  final int? initialValue;

  /// Показывать ли кнопку очистки при наличии значения.
  final bool showClearButton;

  /// Декорация поля ввода.
  final InputDecoration decoration;

  /// Валидатор формы.
  final FormFieldValidator<T?>? validator;

  /// Активно ли поле.
  final bool enabled;

  /// Состояние загрузки данных.
  final bool isLoading;

  @override
  State<SearchableListDropdown<T>> createState() =>
      _SearchableListDropdownState<T>();
}

class _SearchableListDropdownState<T> extends State<SearchableListDropdown<T>> {
  static const _maxVisible = 7;

  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormFieldState<T>>();

  SearchableItem<T>? _selected;
  int _highlightedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selected = _findById(widget.initialValue);
    if (_selected != null) {
      _textController.text = _selected!.label;
    }
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(SearchableListDropdown<T> old) {
    super.didUpdateWidget(old);
    if (old.initialValue != widget.initialValue) {
      final item = _findById(widget.initialValue);
      setState(() => _selected = item);
      _textController.text = item?.label ?? '';
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      // Если фокус потерян — восстановить текст выбранного
      if (_selected != null) {
        _textController.text = _selected!.label;
      } else {
        _textController.clear();
      }
    }
  }

  SearchableItem<T>? _findById(int? id) {
    if (id == null) return null;
    try {
      return widget.items.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  List<SearchableItem<T>> _filter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      return List<SearchableItem<T>>.from(widget.items)
        ..sort((a, b) => b.id.compareTo(a.id));
    }

    final filtered = widget.items.where((e) {
      return e.label.toLowerCase().contains(q) ||
          e.id.toString().contains(q) ||
          (e.subtitle?.toLowerCase().contains(q) ?? false);
    }).toList();

    // Сортировка по релевантности при поиске
    filtered.sort((a, b) {
      final aLabel = a.label.toLowerCase();
      final bLabel = b.label.toLowerCase();
      final aId = a.id.toString();
      final bId = b.id.toString();

      // 1. Точное совпадение ID
      if (aId == q && bId != q) return -1;
      if (bId == q && aId != q) return 1;

      // 2. Начинается с запроса (label)
      final aStarts = aLabel.startsWith(q);
      final bStarts = bLabel.startsWith(q);
      if (aStarts && !bStarts) return -1;
      if (bStarts && !aStarts) return 1;

      // 3. Содержит запрос (label) - по позиции вхождения
      final aIdx = aLabel.indexOf(q);
      final bIdx = bLabel.indexOf(q);
      if (aIdx != bIdx && aIdx != -1 && bIdx != -1) {
        return aIdx.compareTo(bIdx);
      }

      // 4. Если всё равно, то по ID (по убыванию)
      return b.id.compareTo(a.id);
    });

    return filtered;
  }

  void _onSelected(FormFieldState<T> state, SearchableItem<T> item) {
    setState(() {
      _selected = item;
      _textController.text = item.label;
      _highlightedIndex = 0;
    });
    state.didChange(item.value);
    widget.onChanged(item.value);
    _focusNode.unfocus();
  }

  void _onClear(FormFieldState<T> state) {
    setState(() {
      _selected = null;
      _textController.clear();
      _highlightedIndex = 0;
    });
    state.didChange(null);
    widget.onChanged(null);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      key: _formKey,
      validator: widget.validator,
      builder: (state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return RawAutocomplete<SearchableItem<T>>(
              textEditingController: _textController,
              focusNode: _focusNode,
              displayStringForOption: (o) => o.label,
              optionsBuilder: (textEditingValue) =>
                  _filter(textEditingValue.text),
              onSelected: (item) => _onSelected(state, item),
              fieldViewBuilder: (ctx, controller, focusNode, onSubmit) =>
                  _buildField(state, controller, focusNode, onSubmit),
              optionsViewBuilder: (ctx, onSelected, options) =>
                  _buildOptions(ctx, onSelected, options, constraints.maxWidth),
            );
          },
        );
      },
    );
  }

  Widget _buildField(
    FormFieldState<T> state,
    TextEditingController controller,
    FocusNode focusNode,
    VoidCallback onSubmit,
  ) {
    final showId = _selected != null && controller.text == _selected!.label;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final count = _filter(controller.text).take(_maxVisible).length;
          if (count > 0) {
            setState(() => _highlightedIndex = (_highlightedIndex + 1) % count);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          final count = _filter(controller.text).take(_maxVisible).length;
          if (count > 0) {
            setState(
              () => _highlightedIndex = (_highlightedIndex - 1 + count) % count,
            );
          }
        },
      },
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: widget.enabled && !widget.isLoading,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        decoration: widget.decoration.copyWith(
          labelText: widget.label.isNotEmpty ? widget.label : null,
          hintText: widget.isLoading
              ? 'Загрузка...'
              : (widget.hint.isNotEmpty ? widget.hint : null),
          errorText: state.errorText,
          prefixIcon: showId
              ? Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: UnconstrainedBox(child: _idBadge(_selected!.id)),
                )
              : null,
          suffixIcon: _buildSuffix(state),
        ),
        onSubmitted: (value) {
          final matches = _filter(value).take(_maxVisible).toList();
          if (matches.isNotEmpty) {
            final idx =
                _highlightedIndex < matches.length ? _highlightedIndex : 0;
            _onSelected(state, matches[idx]);
          } else {
            onSubmit();
          }
        },
      ),
    );
  }

  Widget _buildSuffix(FormFieldState<T> state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.isLoading)
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
          )
        else ...[
          if (widget.showClearButton && _selected != null)
            IconButton(
              onPressed: () => _onClear(state),
              icon: Icon(
                Icons.cancel_rounded,
                size: 18,
                color: AppColors.textGrey.withValues(alpha: .5),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () => _showDialog(state),
            icon: const Icon(
              Icons.list_alt_rounded,
              color: AppColors.primary,
              size: 20,
            ),
            splashRadius: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }

  Future<void> _showDialog(FormFieldState<T> state) async {
    _focusNode.unfocus();
    final result = await showDialog<SearchableItem<T>>(
      context: context,
      builder: (context) => _ItemsDialog<T>(
        items: widget.items,
        selected: _selected,
      ),
    );

    if (result != null && mounted) {
      _onSelected(state, result);
    }
  }

  Widget _buildOptions(
    BuildContext context,
    AutocompleteOnSelected<SearchableItem<T>> onSelected,
    Iterable<SearchableItem<T>> options,
    double fieldWidth,
  ) {
    final all = options.toList();
    final visible = all.take(_maxVisible).toList();
    final idx = _highlightedIndex >= visible.length ? 0 : _highlightedIndex;

    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: fieldWidth,
          constraints: const BoxConstraints(maxHeight: 360),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: Colors.grey.withValues(alpha: .2)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shrinkWrap: true,
                  itemCount: visible.length,
                  separatorBuilder: (_, _) => Divider(
                    height: 1,
                    color: Colors.grey.withValues(alpha: .1),
                  ),
                  itemBuilder: (ctx, i) {
                    final item = visible[i];
                    final highlighted = i == idx;
                    return InkWell(
                      onTap: () => onSelected(item),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 120),
                        color: highlighted
                            ? AppColors.primary.withValues(alpha: .06)
                            : Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            _idBadge(item.id),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: highlighted
                                          ? AppColors.primary
                                          : null,
                                    ),
                                  ),
                                  if (item.subtitle != null &&
                                      item.subtitle!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        item.subtitle!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textGrey,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (highlighted)
                              const Icon(
                                Icons.keyboard_return_rounded,
                                size: 16,
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Футер с счётчиком
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .04),
                  border: Border(
                    top: BorderSide(color: Colors.grey.withValues(alpha: .1)),
                  ),
                ),
                child: Text(
                  visible.length < all.length
                      ? 'Показано ${visible.length} из ${all.length}'
                      : 'Всего: ${all.length}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _idBadge(int id) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: .08),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      '$id',
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    ),
  );
}

/// Внутренний диалог выбора из списка для [SearchableListDropdown].
class _ItemsDialog<T> extends StatefulWidget {
  const _ItemsDialog({
    required this.items,
    this.selected,
  });

  final List<SearchableItem<T>> items;
  final SearchableItem<T>? selected;

  @override
  State<_ItemsDialog<T>> createState() => _ItemsDialogState<T>();
}

class _ItemsDialogState<T> extends State<_ItemsDialog<T>> {
  final _searchController = TextEditingController();
  List<SearchableItem<T>> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = _sort(widget.items);
    _searchController.addListener(_onSearch);
  }

  List<SearchableItem<T>> _sort(List<SearchableItem<T>> list) {
    return List<SearchableItem<T>>.from(list)
      ..sort((a, b) => b.id.compareTo(a.id));
  }

  void _onSearch() {
    final q = _searchController.text.toLowerCase().trim();
    setState(() {
      if (q.isEmpty) {
        _filtered = _sort(widget.items);
      } else {
        _filtered = widget.items.where((e) {
          return e.label.toLowerCase().contains(q) ||
              e.id.toString().contains(q) ||
              (e.subtitle?.toLowerCase().contains(q) ?? false);
        }).toList();

        // Сортировка по релевантности (как в основном виджете)
        _filtered.sort((a, b) {
          final aLabel = a.label.toLowerCase();
          final bLabel = b.label.toLowerCase();
          final aId = a.id.toString();
          final bId = b.id.toString();
          if (aId == q && bId != q) return -1;
          if (bId == q && aId != q) return 1;
          final aStarts = aLabel.startsWith(q);
          final bStarts = bLabel.startsWith(q);
          if (aStarts && !bStarts) return -1;
          if (bStarts && !aStarts) return 1;
          return b.id.compareTo(a.id);
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420, maxHeight: 620),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 40,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSearch(context),
            ),
            const SizedBox(height: 10),
            Expanded(child: _buildList()),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primary.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 8, 16),
        child: Row(
          children: [
            const Icon(Icons.list_alt_rounded, color: Colors.white70, size: 20),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Выберите из списка',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded, color: Colors.white70),
            ),
          ],
        ),
      );

  Widget _buildSearch(BuildContext context) => TextField(
        controller: _searchController,
        autofocus: true,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Поиск по названию или ID...',
          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: .3)),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded, size: 16),
                  onPressed: _searchController.clear,
                )
              : null,
        ),
      );

  Widget _buildList() {
    if (_filtered.isEmpty) {
      return const Center(child: Text('Ничего не найдено'));
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: _filtered.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final item = _filtered[index];
        final isSelected = item.id == widget.selected?.id;
        return InkWell(
          onTap: () => Navigator.pop(context, item),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: .07)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: .3)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                _idBadge(item.id),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.label,
                        style: const TextStyle(fontSize: 14),
                      ),
                      if (item.subtitle != null)
                        Text(
                          item.subtitle!,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textGrey,
                          ),
                        ),
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle, color: AppColors.primary),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _idBadge(int id) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: .08),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          '$id',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      );
}

/// Элемент списка для [SearchableListDropdown].
class SearchableItem<T> {
  const SearchableItem({
    required this.id,
    required this.label,
    required this.value,
    this.subtitle,
  });

  /// Числовой идентификатор (поиск по нему включён).
  final int id;

  /// Основная отображаемая строка.
  final String label;

  /// Дополнительная информация (показывается под label).
  final String? subtitle;

  /// Исходный объект, который возвращается в [onChanged].
  final T value;
}
