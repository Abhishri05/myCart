import "package:flutter/material.dart";
import 'package:my_cart/Pages/home_page.dart';
import 'package:my_cart/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(brightness: Brightness.dark),

      // initialRoute: "/login",
      routes: {
        "/": (context) => LoginPage(), //  "/" Route ka Mtlb Home Page
        "/login": (context) => HomePage()
      },
    );
  }
}
