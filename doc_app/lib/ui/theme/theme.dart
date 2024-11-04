import 'package:flutter/material.dart';

const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 25);

final theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(24, 160, 251, 1),
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(156, 163, 176, 1),
    onSecondary: Color.fromRGBO(156, 163, 176, 0.1),
    error: Color.fromRGBO(255, 235, 234, 1),
    onError: Color.fromRGBO(239, 49, 37, 1),
    surface: Color.fromRGBO(151, 151, 151, 0.05),
    onSurface: Color.fromRGBO(44, 49, 52, 1),
  ),
  scaffoldBackgroundColor: Colors.grey[200],
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w500,
    ),
  ),
);
