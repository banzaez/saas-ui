import 'package:flutter/material.dart';

import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get theme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
}
