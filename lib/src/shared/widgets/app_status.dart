import 'package:flutter/material.dart';

class AppStatus extends StatelessWidget {
  const AppStatus({
    super.key,
    required this.status,
    required this.color,
    this.isUppercase = true,
  });

  final String status;
  final Color color;
  final bool isUppercase;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.15), width: 1),
      ),
      child: Text(
        isUppercase ? status.toUpperCase() : status,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ).copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.8, height: 1),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
