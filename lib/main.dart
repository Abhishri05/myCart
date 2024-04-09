import "package:flutter/material.dart";
import 'package:my_cart/Pages/home_page.dart';
import 'package:my_cart/Pages/login.dart';
import 'package:my_cart/utlis/routes.dart';
import 'package:my_cart/widgets/themes.dart';

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
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeroute,
      routes: {
        "/": (context) => LoginPage(), //  "/" Route ka Mtlb Home Page
        MyRoutes.homeroute: (context) => HomePage(),
        MyRoutes.loginroute: (context) => LoginPage(),
        // MyRoutes.homedetails: (context) => HomeDetailPage()
      },
    );
  }
}
