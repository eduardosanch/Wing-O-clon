import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF021B24),

    primaryColor: const Color(0xFF0A6C74),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF13B5B1),
      secondary: Color(0xFF5CE1E6),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF062F3C),
      elevation: 0,
    ),
  );
}