import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    // ignore: deprecated_member_use
    background: Colors.grey.shade300, // Fixed color code (adjusted the `30e` to `300`)
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ), // ColorScheme.light
  brightness: Brightness.light,
  primaryColor: Colors.grey.shade500,
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  
);
