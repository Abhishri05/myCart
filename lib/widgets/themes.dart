import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:velocity_x/velocity_x.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.amber,
      cardColor: Colors.white,
      canvasColor: creamColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      // primaryTextTheme: GoogleFonts.latoTextTheme()
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontFamily: GoogleFonts.poppins().fontFamily),
        elevation: 0,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,

      // primaryTextTheme: GoogleFonts.latoTextTheme()
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.amber),
        elevation: 0,
      ));

  // Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  // static Color darkcreamColor = const Color(0xff0b0b0b);
  static Color darBluish = const Color(0xff403b58);
  static Color lightdarBluish = Vx.indigo500;
}
