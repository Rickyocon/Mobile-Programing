import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timeattack/Pages/FourthTask.dart';
import 'dart:async';
import 'Pages/HomePage.dart';
import 'Pages/LoginPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        databaseURL:
            "https://mobile-programing-final-login-default-rtdb.firebaseio.com",
        apiKey: "AIzaSyAzyY88-zxgkUM5NiZuihujcy-OBsTEYB8",
        appId: "1:779226914872:web:b5d7b3622e4ab1a3f446cd",
        messagingSenderId: "779226914872",
        projectId: "mobile-programing-final-login"),
  );
  runApp(const MyApp());
}

//declare player variable for audio
final player = AudioPlayer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Attack',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.poorStoryTextTheme(),
        scaffoldBackgroundColor: const Color.fromARGB(255, 3, 48, 117),
      ),
      home: const LoginHomePage(),
    );
  }
}
