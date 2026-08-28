import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

part 'navigation_service.g.dart';

class NavigationService {
  Future<void> launchExternalUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Не удалось открыть ссылку: $url',
      );
      throw Exception('Could not launch $url');
    }
  }

  /// Открывает внутренний путь приложения в новой вкладке (актуально для Web)
  Future<void> openInternalInNewTab(String location) async {
    final baseUri = Uri.base;
    final targetUri = Uri.parse(location);

    final Uri fullUri;
    if (baseUri.hasFragment) {
      fullUri = Uri(
        scheme: baseUri.scheme,
        host: baseUri.host,
        port: baseUri.port,
        fragment: targetUri.toString(),
      );
    } else {
      fullUri = Uri(
        scheme: baseUri.scheme,
        host: baseUri.host,
        port: baseUri.port,
        path: targetUri.path,
        queryParameters:
            targetUri.queryParameters.isEmpty ? null : targetUri.queryParameters,
      );
    }

    try {
      await launchUrl(fullUri, webOnlyWindowName: '_blank');
    } catch (e) {
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Не удалось открыть ссылку: $fullUri',
      );
    }
  }
}

@Riverpod(keepAlive: true)
NavigationService navigationService(Ref ref) {
  return NavigationService();
}
