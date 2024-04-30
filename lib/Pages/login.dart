import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, "/home");

      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 40),
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
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter User Name", labelText: "User Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter UserName";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (value.length < 5) {
                          return "Enter Strong Password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8),
                      child: InkWell(
                        // splashColor: Colors.amber,
                        onTap: () => movetoHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changebutton ? 50 : 120,
                          height: 40,
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(
                          //     //   shape:
                          //     //       changebutton ? BoxShape.circle : BoxShape.rectangle,
                          //     color: Colors.deepPurple,
                          //     borderRadius:
                          //         BorderRadius.circular(changebutton ? 50 : 8)),
                          child: changebutton
                              ? const Icon(Icons.done, color: Colors.amber)
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
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
      ),
    );
  }
}
