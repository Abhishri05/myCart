import "package:flutter/material.dart";
import "package:my_cart/widgets/drawer.dart";

class HomePage extends StatelessWidget {
  final int nums = 30;
  final String str = "CodePur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HTML Jese Head BOdy aur Foot hota hai iska

      appBar: AppBar(
        title: const Text("Catalog App"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(child: Text("Welcome to $nums days of Flutter from $str")),

      drawer: myDrawer(),
    );
  }
}
