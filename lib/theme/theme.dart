import 'package:flutter/material.dart';

class WAppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
    ),
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.lightBlue,
      elevation: 1,
    ),
  );
  static ThemeData darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey,
      elevation: 1,
    ),
  );
}
