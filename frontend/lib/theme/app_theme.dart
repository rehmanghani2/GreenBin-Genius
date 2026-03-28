import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    primarySwatch: Colors.green,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 26),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
