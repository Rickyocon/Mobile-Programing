import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'HomePage.dart';
import 'SignUpPage.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  //Initialize Firebase app
  Future<FirebaseApp> _initalizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initalizeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Login Function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("There is no account associated with that email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    //create the textfeild controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Time Attack",
              style: TextStyle(
                color: Color.fromARGB(255, 222, 147, 34),
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Login to Time Attack",
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email Address",
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
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
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
                    builder: (_) => const SignUpPage(),
                  ),
                );
              },
              child: const Text(
                "Don't have an account, Sign up here!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 88.0,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Color.fromARGB(255, 171, 50, 20),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () async {
                  //lest test the app
                  User? user = await loginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  // ignore: avoid_print
                  print(user);
                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
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
