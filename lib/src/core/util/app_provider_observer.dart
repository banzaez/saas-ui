import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';

/// Глобальный наблюдатель за состояниями провайдеров Riverpod (Riverpod 3.x).
/// Автоматически логирует ошибки во всех провайдерах.
base class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (newValue is AsyncError) {
      AppLogger.error(
        'Provider error in ${context.provider.name ?? context.provider.runtimeType}',
        error: newValue.error,
        stackTrace: newValue.stackTrace,
      );
    }
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    AppLogger.error(
      'Provider exception in ${context.provider.name ?? context.provider.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
