import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppDropdown<T> extends StatefulWidget {
  const AppDropdown({
    super.key,
    required this.onChanged,
    this.initialValue,
    this.enumValues,
    this.items,
    this.hint = '',
    this.isExpanded = true,
    this.showClearButton = true,
    this.validator,
    this.decoration = const InputDecoration(),
    this.label = '',
  }) : assert(
         items != null || enumValues != null,
         'Должен быть указан хотя бы один из параметров: items или enumValues',
       );

  final ValueChanged<T?>? onChanged;
  final T? initialValue;
  final List<EnumWithText>? enumValues;
  final List<DropdownMenuItem<T>>? items;
  final String hint;
  final bool isExpanded;
  final bool showClearButton;
  final FormFieldValidator<T?>? validator;
  final InputDecoration decoration;
  final String label;

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  static const _borderRadius = BorderRadius.all(Radius.circular(8));

  T? _value;
  late List<DropdownMenuItem<T>> _items;
  InputDecoration? _decoration;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    _items = _buildItems();
    _updateDecoration();
  }

  @override
  void didUpdateWidget(AppDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldValue = _value;

    // Обновляем значение, если initialValue изменился
    if (widget.initialValue != oldWidget.initialValue) {
      _value = widget.initialValue;
    }

    // Пересоздаем items, если изменились enumValues или items
    if (widget.items != oldWidget.items ||
        widget.enumValues != oldWidget.enumValues) {
      _items = _buildItems();
    }

    // Обновляем decoration, если изменились параметры или значение
    if (widget.showClearButton != oldWidget.showClearButton ||
        _value != oldValue) {
      _updateDecoration();
    }
  }

  List<DropdownMenuItem<T>> _buildItems() {
    if (widget.items != null) return widget.items!;

    return widget.enumValues
            ?.map(
              (e) => DropdownMenuItem<T>(
                value: e as T,
                child: Text(
                  e.text(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            )
            .toList() ??
        [];
  }

  void _updateDecoration() {
    _decoration = widget.decoration.copyWith(
      labelText: widget.label.isNotEmpty ? widget.label : null,
    );
  }

  void _clearValue() {
    setState(() {
      _value = null;
      _updateDecoration();
    });
    widget.onChanged?.call(null);
  }

  void _onChanged(T? value) {
    setState(() {
      _value = value;
      _updateDecoration();
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final hint = widget.hint.isNotEmpty ? Text(widget.hint) : null;

    return DropdownButtonFormField<T?>(
      onChanged: _onChanged,
      initialValue: _value,
      items: _items,
      decoration: _decoration,
      isExpanded: widget.isExpanded,
      hint: hint,
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showClearButton && _value != null)
            IconButton(
              icon: Icon(
                Icons.cancel_rounded,
                size: 18,
                color: AppColors.textGrey.withValues(alpha: .5),
              ),
              onPressed: _clearValue,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textGrey.withValues(alpha: .8),
            size: 22,
          ),
          const SizedBox(width: 8),
        ],
      ),
      borderRadius: _borderRadius,
      validator: widget.validator,
    );
  }
}
