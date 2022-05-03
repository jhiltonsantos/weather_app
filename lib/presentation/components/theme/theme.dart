import 'package:flutter/material.dart';

import 'colors.dart';

final weatherTheme = theme;

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffeaeaea),
  textTheme: const TextTheme(subtitle1: TextStyle(color: primaryColor)),
  primaryColor: const Color(0xFF3a304f),
  primarySwatch: Colors.teal,
  buttonTheme: const ButtonThemeData(
    buttonColor: floatingActionColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.white, primary: floatingActionColor)),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: floatingActionColor),
);
