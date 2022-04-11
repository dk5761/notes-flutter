import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bgLightColor,
      textTheme: GoogleFonts.nunitoSansTextTheme(
        Theme.of(context).textTheme,
      ));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bgDarkColor,
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme,
      ));
}
