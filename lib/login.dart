import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

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
            Text(
              "Welcome $name",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                  const SizedBox(height: 40),

                  InkWell(
                    // splashColor: Colors.amber,

                    onTap: () async {
                      setState(() {
                        changebutton = true;
                      });

                      await Future.delayed(const Duration(seconds: 1));
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, "/home");
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changebutton ? 50 : 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          //   shape:
                          //       changebutton ? BoxShape.circle : BoxShape.rectangle,
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 8)),
                      child: changebutton
                          ? const Icon(Icons.done, color: Colors.amber)
                          : const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, "/home");
                  //   },
                  //   style: TextButton.styleFrom(
                  //       backgroundColor: Colors.deepPurple,
                  //       minimumSize: const Size(100, 40),
                  //       shape: const BeveledRectangleBorder()),
                  //   child: const Text(
                  //     "Login",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
