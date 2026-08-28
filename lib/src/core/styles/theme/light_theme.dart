import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class LightTheme {
  LightTheme._();

  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundScreen,
    ),
    scaffoldBackgroundColor: AppColors.backgroundScreen,
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    checkboxTheme: _checkboxTheme,
    primarySwatch: AppColors.primary,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    fontFamily: GoogleFonts.openSans().fontFamily,
    dialogTheme: DialogThemeData(backgroundColor: AppColors.backgroundScreen),
  );

  // --------------------------------------------------------------------------------------------

  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return const Color(0xFFE5E7EB);
    }),
    side: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF9FAFB),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: const TextStyle(color: Color(0xFF4B5563)),
    labelStyle: const TextStyle(color: Color(0xFF4B5563)),
  );
}
