import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/features/home/users/application/users_notifier.dart';
import 'package:saas_ui/src/features/home/users/application/users_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class UsersTable extends ConsumerWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(usersProvider.select((s) => s.value));
    final listNotifier = ref.read(usersProvider.notifier);
    final panelNotifier = ref.read(usersPanelProvider.notifier);

    return AppTable<User>(
      onTap: panelNotifier.open,
      onLoadMore: listNotifier.fetchNextPage,
      sourceController: listNotifier,
      columns: _buildColumns(listNotifier),
    );
  }

  List<AppTableColumn<User>> _buildColumns(Users listNotifier) => [
    AppTableColumn(
      title: 'ID',
      size: const AppTableColumnSize.id(),
      cellBuilder: (item) => RowIdCell(id: item.id.toString()),
    ),
    AppTableColumn(
      title: 'Компания',
      cellBuilder: (item) => RowStringCell(value: item.companyName),
      isVisible: false,
    ),
    AppTableColumn(
      title: 'Email',
      size: const AppTableColumnSize.flex(2),
      cellBuilder: (item) =>
          RowStringCell(stringToInitials: item.email, value: item.email),
    ),
    AppTableColumn(
      title: 'Наименование',
      size: const AppTableColumnSize.flex(2),
      cellBuilder: (item) => RowStringCell(value: item.fullName),
    ),
    AppTableColumn(
      title: 'Роль',
      cellBuilder: (item) =>
          RowStatusCell(value: item.role, color: item.role.color),
    ),
    AppTableDefaultActionsColumn.create(
      cellBuilder: (item) =>
          RowActionsCell(onDelete: () => listNotifier.deleteItem(item.id!)),
    ),
  ];
}
