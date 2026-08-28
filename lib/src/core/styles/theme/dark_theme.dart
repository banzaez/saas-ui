import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class DarkTheme {
  DarkTheme._();

  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.backgroundScreenDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundScreenDark,
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    checkboxTheme: _checkboxTheme,
    primarySwatch: AppColors.primary,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: AppColors.greyDark,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.foregroundColorDark,
      onSurface: Colors.white,
    ),
    fontFamily: GoogleFonts.openSans().fontFamily,
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.backgroundScreenDark,
    ),
  );

  // --------------------------------------------------------------------------------------------

  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return const Color(0xFF4B5563);
    }),
    side: const BorderSide(color: Color(0xFF4B5563), width: 1),
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
    fillColor: const Color(0xFF2C2C2C),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF4B5563)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF4B5563)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
    labelStyle: const TextStyle(color: Color(0xFF9CA3AF)),
  );
}
