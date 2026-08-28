import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppWidgetStyles {
  AppWidgetStyles._();

  static const double borderRadius = 12.0;

  /// Тема для ExpansionTile, убирающая разделители и настраивающая скругления
  static ThemeData expansionTileTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
      listTileTheme: ListTileThemeData(shape: expansionTileShape),
    );
  }

  /// Форма для раскрывающихся панелей
  static ShapeBorder expansionTileShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );

  /// Декорация для карточки пакета
  static BoxDecoration packageCardDecoration(
    BuildContext context, {
    bool isRecommended = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: isRecommended
            ? AppColors.secondary
            : (isDark ? Colors.white.withAlpha(20) : Colors.grey[300]!),
        width: isRecommended ? 2.5 : 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(isDark ? 40 : 15),
          blurRadius: 20,
          spreadRadius: -5,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  /// Стиль кнопки в карточке пакета
  static ButtonStyle packageButtonStyle(
    BuildContext context, {
    bool isRecommended = false,
    bool isMini = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ElevatedButton.styleFrom(
      backgroundColor: isRecommended
          ? AppColors.secondary
          : (isDark ? Colors.grey[800] : Colors.white),
      foregroundColor: isRecommended
          ? Colors.white
          : (isDark ? Colors.white : AppColors.primary),
      minimumSize: Size(double.infinity, isMini ? 40 : 54),
      padding: isMini ? const EdgeInsets.symmetric(horizontal: 16) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: !isRecommended && !isDark
            ? BorderSide(color: Colors.grey[300]!)
            : BorderSide.none,
      ),
      elevation: isRecommended ? 4 : 0,
      shadowColor: AppColors.secondary.withAlpha(100),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
