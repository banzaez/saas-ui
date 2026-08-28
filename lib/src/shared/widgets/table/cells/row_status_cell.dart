import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/shared/widgets/app_status.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowStatusCell extends AppTableCell {
  const RowStatusCell({
    super.key,
    super.leading,
    super.trailing,
    required this.value,
    required this.color,
  });

  final EnumWithText value;
  final Color color;

  @override
  Widget buildValue(BuildContext context, TextStyle style) => Center(
    child: AppStatus(status: value.text(), color: color),
  );
}
