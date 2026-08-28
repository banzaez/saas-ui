import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowWidgetCell extends AppTableCell {
  const RowWidgetCell({super.key, required this.child});

  final Widget child;

  @override
  Widget buildValue(BuildContext context, TextStyle style) => child;

  @override
  Widget? buildSubvalue(BuildContext context, TextStyle style) => null;
}
