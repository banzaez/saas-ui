import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';

/// CRUD-панель на Riverpod: элемент из [watchPanel], сохранение через [performSave].
///
/// Альтернатива без Riverpod: [CrudPanelController] + [BaseCrudEditPanel].
abstract class BaseRiverpodCrudEditPanel<T extends BaseModel>
    extends ConsumerWidget {
  const BaseRiverpodCrudEditPanel({super.key});

  /// Текущий элемент панели из провайдера (`null` — панель скрыта).
  T? watchPanel(WidgetRef ref);

  Future<T?> performSave(WidgetRef ref, T item);

  void closePanel(WidgetRef ref);

  /// См. [onCancel] в [build].
  void afterCancel(WidgetRef ref) {}

  String get createTitle;
  String get editTitle;

  double get maxWidth => 500;
  double get formSpacing => 16;
  String get saveLabel => 'Сохранить';
  String get cancelLabel => 'Отменить';

  bool isCreating(T item) => item.id == null || item.id == -1;

  Object? panelItemKey(T item) => item.id;

  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, T item) => null;

  List<Widget> buildFormChildren(BuildContext context, WidgetRef ref, T item);

  Widget? buildActionsPrefix(BuildContext context, WidgetRef ref) => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = watchPanel(ref);
    if (item == null) return const SizedBox.shrink();

    return AppEditPanel(
      key: ValueKey(panelItemKey(item) ?? 'new'),
      title: isCreating(item) ? createTitle : editTitle,
      maxWidth: maxWidth,
      spacing: formSpacing,
      saveLabel: saveLabel,
      cancelLabel: cancelLabel,
      actionsPrefix: buildActionsPrefix(context, ref),
      info: buildInfo(ref, item),
      onSave: () async {
        final saved = await performSave(ref, item);
        if (saved != null) closePanel(ref);
      },
      onCancel: () {
        closePanel(ref);
        afterCancel(ref);
      },
      children: buildFormChildren(context, ref, item),
    );
  }
}
