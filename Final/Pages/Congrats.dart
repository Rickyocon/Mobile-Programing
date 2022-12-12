import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'HomePage.dart';

class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _Congrats();
}

class _Congrats extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Good Job!'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await player.stop();
          // ignore: avoid_print
          print("Alarm has stoped");
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MyHomePage(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  "Congratulations",
                  colors: [Colors.red, Colors.blue, Colors.black],
                  textStyle: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ColorizeAnimatedText(
                  "Click the home button to stop the alarm and return to the home screen",
                  colors: [
                    Colors.red,
                    Colors.blue,
                    const Color.fromARGB(255, 222, 147, 34)
                  ],
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
