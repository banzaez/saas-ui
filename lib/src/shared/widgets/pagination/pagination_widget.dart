import 'package:flutter/material.dart';

/// Виджет отображения счётчика элементов таблицы.
/// Показывает "Показано N элементов". Скрывается если [itemsCount] <= 0.
class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key, required this.itemsCount});

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    if (itemsCount <= 0) return const SizedBox.shrink();

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Color(0xFF6B7280),
        ),
        children: [
          const TextSpan(text: 'Показано '),
          TextSpan(
            text: '$itemsCount',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const TextSpan(text: ' элементов'),
        ],
      ),
    );
  }
}
