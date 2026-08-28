import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key, this.strokeWidth});

  final double? strokeWidth;

  @override
  Widget build(BuildContext context) =>
      CircularProgressIndicator(strokeWidth: strokeWidth);
}
