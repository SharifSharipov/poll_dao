import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme=ThemeData(
    textTheme: const TextTheme(
      ///display
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    )
  );
}