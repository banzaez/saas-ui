import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

/// Контейнер для отображения формулы с подписью и hover-подсветкой полей.
class FormulaContainer extends StatelessWidget {
  const FormulaContainer({
    super.key,
    required this.label,
    required this.child,
    this.hint,
    this.onEnter,
    this.onExit,
  });

  final String label;
  final Widget child;
  final String? hint;
  final VoidCallback? onEnter;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          ),
        ),
      ),
      MouseRegion(
        onEnter: (_) => onEnter?.call(),
        onExit: (_) => onExit?.call(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary.withAlpha(30)),
          ),
          child: Center(child: FittedBox(child: child)),
        ),
      ),
      if (hint != null)
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 4),
          child: Text(
            hint!,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
        ),
    ],
  );
}

/// Один элемент формулы — значение и подпись с hover-интерактивностью.
class FormulaPart extends StatelessWidget {
  const FormulaPart({
    super.key,
    required this.value,
    required this.label,
    this.onHover,
  });

  final String value;
  final String label;
  final ValueChanged<bool>? onHover;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => onHover?.call(true),
    onExit: (_) => onHover?.call(false),
    cursor: SystemMouseCursors.click,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withAlpha(40)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    ),
  );
}

/// Символ оператора между элементами формулы (×, ÷, =, на, ...).
class FormulaSymbol extends StatelessWidget {
  const FormulaSymbol(this.symbol, {super.key});

  final String symbol;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Text(
      symbol,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      ),
    ),
  );
}
