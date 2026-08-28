import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();

  static Widget defaultDialog({
    required Widget child,
    double? maxWidth,
    double? maxHeight,
    double? minWidth,
    double? minHeight,
  }) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
        minHeight: minHeight ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
      ),
      padding: const EdgeInsets.all(24),
      child: child,
    ),
  );
}
