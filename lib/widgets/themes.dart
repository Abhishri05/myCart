import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.amber,
      fontFamily: GoogleFonts.lato().fontFamily,
      // primaryTextTheme: GoogleFonts.latoTextTheme()
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.amber),
        elevation: 0,
      ));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
