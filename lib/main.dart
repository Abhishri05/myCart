import "package:flutter/material.dart";

void main(){

  runApp(MyApp());
}

  class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    int nums = 30;
    String str = "Aditi";

    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text('Welcome to $nums days of Flutter $str'),
          )
          ),
      ),
    );
  }
}
