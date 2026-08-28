import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 16,
    children: [
      Icon(Icons.bar_chart_outlined, size: 48, color: AppColors.primary),
      Text(
        'Нет данных',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

class EmptyCertificate extends StatelessWidget {
  const EmptyCertificate({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 16,
    children: [
      Icon(Icons.bar_chart_outlined, size: 48, color: AppColors.primary),
      Text(
        'Выберите сертификат',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
