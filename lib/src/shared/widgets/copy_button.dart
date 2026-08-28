import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.text, this.color, this.size});

  final String text;

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: _onCopyButtonPressed,
    style: IconButton.styleFrom(minimumSize: Size.zero),
    icon: Icon(
      Icons.copy,
      size: size ?? 16,
      color: color ?? Theme.of(context).colorScheme.primary,
    ),
  );

  Future<void> _onCopyButtonPressed() async {
    if (text.trim().isEmpty) return;
    await ClipboardHelper.copy(text);
  }
}
