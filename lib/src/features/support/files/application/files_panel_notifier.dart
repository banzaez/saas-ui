import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';

part 'files_panel_notifier.g.dart';

@riverpod
class FilesPanel extends _$FilesPanel with PanelActions<AppFile> {
  @override
  AppFile? build() => null;
}
