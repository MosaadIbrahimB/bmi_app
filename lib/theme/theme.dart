import 'package:flutter/material.dart';

class ThemeModel {
  static ThemeData themeL = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.grey[600], centerTitle: true),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );
}

class TSModel {
  static TextStyle appBarTitle = const TextStyle(
    fontSize: 28,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
