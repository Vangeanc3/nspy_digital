import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
      primaryColor: ThemeColors.primaryColor,
      brightness: Brightness.light,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            fontSize: 26,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
          )));
}
