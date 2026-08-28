import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import '../models/log_json_models.dart';

class LogJsonStyles {
  static Color getKeyColor(bool isDark) =>
      isDark ? const Color(0xFFD27277) : const Color(0xFFAA3731);

  static Color getStringColor(bool isDark) =>
      isDark ? const Color(0xFF89CA78) : const Color(0xFF43A047);

  static Color getNumberColor(bool isDark) =>
      isDark ? const Color(0xFFD8985F) : const Color(0xFFFB8C00);

  static Color getBoolNullColor(bool isDark) =>
      isDark ? const Color(0xFF61AFEF) : const Color(0xFF1E88E5);

  static Color getBadgeBg(bool isDark) =>
      isDark ? const Color(0xFF1E2F40) : const Color(0xFFE3F2FD);

  static Color getBadgeBorder(bool isDark) =>
      isDark ? const Color(0xFF2C3E50) : const Color(0xFFBBDEFB);

  static Color getBadgeIcon(bool isDark) =>
      isDark ? const Color(0xFF61AFEF) : AppColors.primary;

  static Color getActiveMatchBg() => Colors.orange.withValues(alpha: 0.5);
  static Color getPassiveMatchBg() => Colors.yellow.withValues(alpha: 0.3);

  static TextStyle getBaseStyle(bool isDark) =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w400).copyWith(
        fontFamily: 'monospace',
        height: 1.5,
        letterSpacing: 0,
        color: isDark ? Colors.white : AppColors.textColor,
      );

  static Map<JsonTokenType, TextStyle> getTypeStyles(bool isDark) {
    final baseStyle = getBaseStyle(isDark);
    return {
      JsonTokenType.key: baseStyle.copyWith(color: getKeyColor(isDark)),
      JsonTokenType.string: baseStyle.copyWith(color: getStringColor(isDark)),
      JsonTokenType.number: baseStyle.copyWith(color: getNumberColor(isDark)),
      JsonTokenType.boolean: baseStyle.copyWith(
        color: getBoolNullColor(isDark),
      ),
      JsonTokenType.nullValue: baseStyle.copyWith(
        color: getBoolNullColor(isDark),
      ),
      JsonTokenType.normal: baseStyle,
    };
  }

  static BoxDecoration getContainerDecoration(
    BuildContext context,
    bool isActive,
  ) {
    return BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black.withValues(alpha: 0.3)
          : Colors.grey.shade50,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      border: Border.all(
        color: isActive
            ? AppColors.primary.withValues(alpha: 0.4)
            : AppColors.primary.withValues(alpha: 0.1),
        width: isActive ? 1.5 : 1.0,
      ),
    );
  }

  static BoxDecoration getHeaderDecoration() {
    return BoxDecoration(
      color: AppColors.primary.withValues(alpha: 0.05),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
    );
  }

  static BoxDecoration getFooterDecoration(bool isDark) {
    return BoxDecoration(
      color: AppColors.primary.withValues(alpha: 0.05),
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      border: Border(
        top: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
    );
  }
}
