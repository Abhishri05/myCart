import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
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
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter User Name", labelText: "User Name"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(100, 40),
                        shape: const BeveledRectangleBorder()),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
