import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/pagination/pagination_widget.dart';

/// Футер таблицы с информацией о количестве элементов.
///
/// [itemsCount] — количество видимых строк (без заголовков групп).
class TablePagination extends StatelessWidget {
  const TablePagination({super.key, required this.itemsCount});

  final int itemsCount;

  @override
  Widget build(BuildContext context) =>
      PaginationWidget(itemsCount: itemsCount);
}
