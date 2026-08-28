// Stub file for non-web platforms
Future<void> copyToClipboardWeb(
  String text, {
  Function()? onSuccess,
  Function(String error)? onError,
}) async {
  // This should never be called on non-web platforms
  // because kIsWeb check happens before calling this
  onError?.call('Web clipboard API not available on this platform');
}
