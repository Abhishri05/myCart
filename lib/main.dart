import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cart/Pages/home_page.dart';
import 'package:my_cart/login.dart';
import 'package:my_cart/utlis/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),

      // initialRoute: "/login",
      routes: {
        "/": (context) => LoginPage(), //  "/" Route ka Mtlb Home Page
        MyRoutes.homeroute: (context) => const HomePage(),
        MyRoutes.loginroute: (context) => LoginPage()
      },
    );
  }
}
