import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //create the textfeild controller
  TextEditingController _SignUpemailController = TextEditingController();
  TextEditingController _SignUPpasswordController = TextEditingController();
  late bool _sucsess;
  late String _userEmail;

  void _SignUp() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _SignUpemailController.text,
            password: _SignUPpasswordController.text))
        .user;

    if (user != null) {
      setState(() {
        _sucsess = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _sucsess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "Time Attack",
              style: TextStyle(
                color: Color.fromARGB(255, 222, 147, 34),
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Create an account",
              style: TextStyle(
                color: Colors.red,
                fontSize: 44.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _SignUpemailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter a email Address",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller: _SignUPpasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Create a password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                );
              },
              child: const Text(
                "Return to login page",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 70.0,
            ),
            // ignore: sized_box_for_whitespace
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: double.infinity,
                height: 70,
                child: Material(
                  color: Color.fromARGB(255, 171, 50, 20),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      _SignUp();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ], //Children
        ),
      ),
    );
  }
}
