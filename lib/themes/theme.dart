import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    onBackground: const Color.fromARGB(255, 240, 238, 238),
    primary: Colors.blue.shade700,
    secondary: const Color.fromARGB(255, 124, 124, 124),
    onSecondary: Colors.black87,
    onPrimary: const Color.fromARGB(26, 90, 90, 90),
    onPrimaryContainer: const Color.fromARGB(255, 206, 206, 206),
    onSecondaryContainer: const Color.fromARGB(255, 224, 224, 224),
    inversePrimary: Colors.white,
    outline: const Color.fromARGB(255, 170, 170, 170),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    onBackground: const Color.fromARGB(255, 43, 43, 43),
    primary: Colors.blue.shade700,
    onSecondary: Colors.white,
    secondary: Colors.white54,
    onPrimary: const Color.fromARGB(255, 136, 136, 136),
    onPrimaryContainer: const Color.fromARGB(255, 177, 177, 177),
    onSecondaryContainer: const Color.fromARGB(255, 37, 37, 37),
    inversePrimary: const Color.fromARGB(255, 66, 66, 66),
    outline: const Color.fromARGB(255, 170, 170, 170),
  ),
);
