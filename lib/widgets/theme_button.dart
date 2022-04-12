import 'package:flutter/material.dart';
import 'package:notes/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: () {
        themeProvider.themeMode == ThemeMode.dark
            ? themeProvider.toggleTheme(true)
            : themeProvider.toggleTheme(false);
      },
      child: themeProvider.isDarkMode
          ? const Icon(
              Icons.light_mode_outlined,
              color: Colors.white,
            )
          : const Icon(Icons.dark_mode_rounded, color: Colors.black),
    );
  }
}
