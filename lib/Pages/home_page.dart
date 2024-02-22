import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  final int nums = 30;
  final String str = "CodePur";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HTML Jese Head BOdy aur Foot hota hai iska
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 240, 200, 250),
      ),
      body: Center(
          child: Container(
        child: Text("Welcome to $nums days of Flutter from $str"),
      )),
      drawer: Drawer(),
    );
  }
}