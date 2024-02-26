import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(

      color: Colors.white,
      
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            scale: 3,
            // height: 200,
            // width: 300,,
            // fit: BoxFit.cover,
          ),

          const SizedBox(
            height: 10,
          ),
          
          const Text(
            "Welcome",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
