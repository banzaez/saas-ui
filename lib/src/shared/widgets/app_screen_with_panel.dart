import 'package:flutter/material.dart';

class AppScreenWithPanel extends StatelessWidget {
  const AppScreenWithPanel({
    super.key,
    required this.screen,
    required this.editPanel,
  });

  final Widget screen;

  /// Панель редактирования. Виджет сам управляет своей видимостью
  /// (возвращает [SizedBox.shrink] когда скрыта).
  final Widget editPanel;

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.topRight,
    children: [
      screen,
      Positioned(top: 0, bottom: 16, right: 16, child: editPanel),
    ],
  );
}
