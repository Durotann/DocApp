import 'package:flutter/material.dart';

final theme = ThemeData(
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
  ),
);
