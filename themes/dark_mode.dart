import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    // ignore: deprecated_member_use
    background: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 22, 20, 20),
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ), // ColorScheme.dark
); // ThemeData
