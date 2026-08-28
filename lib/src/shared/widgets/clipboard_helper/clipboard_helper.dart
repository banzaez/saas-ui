import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper_stub.dart'
    if (dart.library.html) 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper_web.dart';

class ClipboardHelper {
  static Future<void> copy(
    String text, {
    Function()? onSuccess,
    Function(String error)? onError,
  }) async {
    if (!kIsWeb) {
      // Android / iOS / Desktop
      try {
        await Clipboard.setData(ClipboardData(text: text));
        onSuccess?.call();
        AppSnackbar.showSuccess(
          title: 'Скопировано',
          message: 'Текст скопирован в буфер обмена',
        );
      } catch (e) {
        onError?.call(e.toString());
        AppSnackbar.showError(
          title: 'Ошибка',
          message: 'Не удалось скопировать текст',
        );
      }
      return;
    }

    // Web
    await copyToClipboardWeb(text, onSuccess: onSuccess, onError: onError);
  }
}
