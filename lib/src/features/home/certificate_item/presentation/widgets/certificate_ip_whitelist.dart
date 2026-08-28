import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/features/home/certificate_item/application/certificate_detail_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/app_expansion_tile.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';
import 'package:string_validator/string_validator.dart';

class CertificateIpWhitelist extends ConsumerStatefulWidget {
  const CertificateIpWhitelist({super.key, required this.certificateId});

  final int certificateId;

  @override
  ConsumerState<CertificateIpWhitelist> createState() =>
      _CertificateIpWhitelistState();
}

class _CertificateIpWhitelistState
    extends ConsumerState<CertificateIpWhitelist> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ipController = TextEditingController();
  String? _editingIP;

  @override
  void dispose() {
    _ipController.dispose();
    super.dispose();
  }

  void _openAddIPDialog() {
    setState(() {
      _editingIP = null;
      _ipController.clear();
    });
  }

  void _openEditIPDialog(String ip) {
    setState(() {
      _editingIP = ip;
      _ipController.text = ip;
    });
  }

  String? _validateIP(String? value) {
    if (value == null || value.isEmpty) return 'Поле обязательно';
    if (!isIP(value)) {
      return 'Неверный IP';
    }
    return null;
  }

  Future<void> _saveIP() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final notifier = ref.read(
      certificateDetailProvider(widget.certificateId).notifier,
    );
    if (_editingIP != null) {
      await notifier.updateIP(_editingIP!, _ipController.text);
    } else {
      await notifier.addIP(_ipController.text);
    }
    _ipController.clear();
  }

  Future<void> _showIPDialog(BuildContext context) => showDialog(
    context: context,
    builder: (dialogContext) => Dialog(
      child: AppContainer(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              TextFormField(
                controller: _ipController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP',
                ),
                validator: _validateIP,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => dialogContext.pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Отмена'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _saveIP();
                      if (dialogContext.mounted) dialogContext.pop();
                    },
                    child: Text(_editingIP != null ? 'Сохранить' : 'Добавить'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(certificateDetailProvider(widget.certificateId));

    return async.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();
        final ipWhitelist = data.certificate.ipWhitelist;

        return AppExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Белый список IP (${ipWhitelist.length})'),
              Text(
                'Если список пуст, доступ разрешен для всех IP-адресов',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
          onExpansionChanged: (_) {},
          children: [
            if (ipWhitelist.isNotEmpty)
              SizedBox(
                height: 300,
                child: AppTable<String>(
                  items: ipWhitelist,
                  buttons: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _openAddIPDialog();
                          _showIPDialog(context);
                        },
                        child: const Text('Добавить IP'),
                      ),
                    ),
                  ],
                  columns: [
                    AppTableColumn(
                      title: 'Белый список IP',
                      cellBuilder: (item) => RowStringCell(value: item),
                    ),
                    AppTableColumn(
                      title: 'Действия',
                      icon: Icons.more_horiz,
                      size: const AppTableColumnSize.fixed(50),
                      isPinned: true,
                      cellBuilder: (item) => RowActionsCell(
                        items: [
                          ActionMenuItem.build(
                            onTap: () {
                              _openEditIPDialog(item);
                              _showIPDialog(context);
                            },
                            label: 'Редактировать',
                            icon: Icons.edit,
                          ),
                        ],
                        onDelete: () => ref
                            .read(
                              certificateDetailProvider(
                                widget.certificateId,
                              ).notifier,
                            )
                            .deleteIP(item),
                      ),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _openAddIPDialog();
                      _showIPDialog(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Добавить IP'),
                  ),
                ),
              ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
