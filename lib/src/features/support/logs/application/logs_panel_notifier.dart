import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/network/repository/logs_repository.dart';

part 'logs_panel_notifier.g.dart';

@riverpod
class LogsPanel extends _$LogsPanel {
  @override
  AsyncValue<Log?> build() => const AsyncData(null);

  Future<void> open(Log summary) async {
    final id = summary.id;
    if (id == null) return;
    state = const AsyncLoading();
    final res = await ref.read(logsRepositoryProvider).getById(id);
    if (!ref.mounted) return;
    if (res.isSuccess && res.result != null) {
      state = AsyncData(res.result);
    } else {
      res.showError();
      state = const AsyncData(null);
    }
  }

  void close() => state = const AsyncData(null);
}
