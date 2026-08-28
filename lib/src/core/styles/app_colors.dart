import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor primary = MaterialColor(0xFF006099, <int, Color>{
    50: Color(0xFFE5F2FF),
    100: Color(0xFFCCE5FF),
    200: Color(0xFF99D4FF),
    300: Color(0xFF66C2FF),
    400: Color(0xFF006099),
    500: Color(0xFF006099),
    600: Color(0xFF006099),
    700: Color(0xFF006099),
    800: Color(0xFF004066),
    900: Color(0xFF002033),
  });

  static const MaterialColor secondary = Colors.orange;

  static final Color greyDark = Colors.grey.shade400;
  static final Color greyDarker = Colors.grey.shade600;

  static const Color disable = Colors.grey;
  static const Color error = Colors.red;
  static const Color edit = Colors.red;

  // Светлая тема ==>
  static final Color backgroundScreen = Colors.grey.shade100;
  static const Color foregroundColor = Colors.white;

  static const Color textColor = Color(0xFF2C3E50);
  static final Color textGrey = Colors.grey.shade600;
  static final Color textBold = primary.shade900;
  // <==

  // Темная тема ==>
  static const Color backgroundScreenDark = Color(0xFF121212);
  static const Color foregroundColorDark = Color(0xFF1E1E1E);

  static const Color textColorDark = Color(0xFFBDC3C7);
  static final Color textGreyDark = Colors.grey.shade400;
  static const Color textBoldDark = Colors.white;
  // <==
}
