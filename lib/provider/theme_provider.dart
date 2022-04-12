import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: Colors.grey.shade900,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: Colors.black,
    backgroundColor: Colors.grey.shade900,
    primaryColorLight: Colors.white,
    textTheme: ThemeData.dark()
        .textTheme
        .apply(bodyColor: Colors.white, displayColor: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      labelStyle: TextStyle(
        decorationColor: Colors.white,
      ),
    ),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      primaryColorLight: Colors.white,
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black //here you can give the text color
          ),
      primaryColorDark: Colors.black,
      backgroundColor: Colors.white,
      textTheme: ThemeData.light()
          .textTheme
          .apply(bodyColor: Colors.black, displayColor: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        labelStyle: TextStyle(
          decorationColor: Colors.black,
        ),
      ));
}
