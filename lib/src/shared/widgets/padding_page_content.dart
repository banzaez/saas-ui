import 'package:flutter/material.dart';

class PaddingPageContent extends StatelessWidget {
  const PaddingPageContent({super.key, this.padding, required this.child});

  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding ?? const EdgeInsets.only(left: 24, right: 24, bottom: 24),
    child: child,
  );
}
