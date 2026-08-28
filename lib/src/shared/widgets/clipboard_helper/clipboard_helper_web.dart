import 'package:web/web.dart' as web;

// Web implementation
Future<void> copyToClipboardWeb(
  String text, {
  Function()? onSuccess,
  Function(String error)? onError,
}) async {
  try {
    web.window.navigator.clipboard.writeText(text);
    onSuccess?.call();
  } catch (e) {
    // fallback — создание временного textarea
    try {
      final textarea =
          web.document.createElement('textarea') as web.HTMLTextAreaElement;
      textarea.value = text;

      web.document.body!.appendChild(textarea);
      textarea.select();
      web.document.execCommand('copy');
      textarea.remove();
      onSuccess?.call();
    } catch (fallbackError) {
      onError?.call(fallbackError.toString());
    }
  }
}
