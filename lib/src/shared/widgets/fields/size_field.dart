import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/fields/numeric_field.dart';

enum SizeUnit {
  bytes(1, 'байт'),
  kb(1024, 'КБ'),
  mb(1024 * 1024, 'МБ'),
  gb(1024 * 1024 * 1024, 'ГБ');

  final int multiplier;
  final String label;
  const SizeUnit(this.multiplier, this.label);
}

enum SizeOperator {
  equal('=', 'Равно'),
  greater('>', 'Больше'),
  less('<', 'Меньше'),
  greaterEqual('>=', 'Не меньше'),
  lessEqual('<=', 'Не больше'),
  notEqual('!=', 'Не равно');

  final String value;
  final String label;
  const SizeOperator(this.value, this.label);

  static SizeOperator fromString(String val) {
    final sorted = List<SizeOperator>.from(values)
      ..sort((a, b) => b.value.length.compareTo(a.value.length));
    for (final op in sorted) {
      if (val.startsWith(op.value)) return op;
    }
    return SizeOperator.greaterEqual;
  }
}

class SizeField extends StatefulWidget {
  final Function(int? bytes)? onChanged;
  final Function(String? value)? onChangedFilter;
  final String label;
  final int? initialBytes;
  final String? initialFilterValue;

  const SizeField({
    super.key,
    this.onChanged,
    this.onChangedFilter,
    required this.label,
    this.initialBytes,
    this.initialFilterValue,
  });

  @override
  State<SizeField> createState() => _SizeFieldState();
}

class _SizeFieldState extends State<SizeField> {
  num? _value;
  SizeUnit _unit = SizeUnit.kb;
  SizeOperator _operator = SizeOperator.greaterEqual;

  @override
  void initState() {
    super.initState();
    if (widget.initialFilterValue != null) {
      _operator = SizeOperator.fromString(widget.initialFilterValue!);
      final digits = widget.initialFilterValue!.replaceAll(
        RegExp(r'[^0-9]'),
        '',
      );
      final bytes = int.tryParse(digits);
      if (bytes != null) {
        _setBytes(bytes);
      }
    } else if (widget.initialBytes != null) {
      _setBytes(widget.initialBytes!);
    }
  }

  void _setBytes(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) {
      _unit = SizeUnit.gb;
      _value = bytes / SizeUnit.gb.multiplier;
    } else if (bytes >= 1024 * 1024) {
      _unit = SizeUnit.mb;
      _value = bytes / SizeUnit.mb.multiplier;
    } else if (bytes >= 1024) {
      _unit = SizeUnit.kb;
      _value = bytes / SizeUnit.kb.multiplier;
    } else {
      _unit = SizeUnit.bytes;
      _value = bytes.toDouble();
    }
  }

  void _notify() {
    final int? totalBytes = _value == null
        ? null
        : (_value! * _unit.multiplier).toInt();
    widget.onChanged?.call(totalBytes);
    if (widget.onChangedFilter != null) {
      if (totalBytes == null) {
        widget.onChangedFilter?.call(null);
      } else {
        widget.onChangedFilter?.call('${_operator.value}$totalBytes');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final showOperator = widget.onChangedFilter != null;

    return NumericField(
      initialValue: _value,
      onChanged: (val) {
        setState(() => _value = val);
        _notify();
      },
      decimals: 0,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        prefixIcon: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 12),
              Container(
                height: 32,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: DropdownButton<SizeUnit>(
                    value: _unit,
                    underline: const SizedBox(),
                    icon: const SizedBox(),
                    alignment: Alignment.center,
                    items: SizeUnit.values
                        .map(
                          (unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(
                              unit.label,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (unit) {
                      if (unit != null) {
                        setState(() => _unit = unit);
                        _notify();
                      }
                    },
                  ),
                ),
              ),
              if (showOperator) ...[
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButton<SizeOperator>(
                    value: _operator,
                    underline: const SizedBox(),
                    icon: const SizedBox(),
                    alignment: Alignment.center,
                    items: SizeOperator.values
                        .map(
                          (op) => DropdownMenuItem(
                            value: op,
                            child: Tooltip(
                              message: op.label,
                              child: Text(
                                op.value,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (op) {
                      if (op != null) {
                        setState(() => _operator = op);
                        _notify();
                      }
                    },
                  ),
                ),
              ],
              const SizedBox(width: 12),
            ],
          ),
        ),
        suffixIcon: _value != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: () {
                    setState(() => _value = null);
                    _notify();
                  },
                ),
              )
            : null,
      ),
    );
  }
}
