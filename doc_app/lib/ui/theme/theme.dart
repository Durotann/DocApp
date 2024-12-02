import 'package:flutter/material.dart';

const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 25);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(24, 160, 251, 1),
    onPrimary: Colors.black,
    secondary: Color(0xFF39B0FF),
    onSecondary: Color.fromRGBO(156, 163, 176, 0.1),
    error: Color.fromRGBO(255, 235, 234, 1),
    onError: Color.fromRGBO(239, 49, 37, 1),
    surface: Color.fromRGBO(151, 151, 151, 0.05),
    onSurface: Color.fromRGBO(44, 49, 52, 1),
  ),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
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
    displaySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
);
