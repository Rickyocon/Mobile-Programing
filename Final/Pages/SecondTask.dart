// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'HomePage.dart';
import 'ThirdTask.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  final _textcontroller = TextEditingController();
  String stringname = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Tasks'),
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
        child: const Text("Exit"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: const Color.fromARGB(255, 222, 147, 34)),
              width: 500,
              height: 150,
              child: const Center(
                child: Text(
                  "In the popular video game series, what type of animal is Sonic?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _textcontroller,
                decoration: InputDecoration(
                  hintText: "Type your answer here!",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textcontroller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (String value) async {
                  if (value == "hedgehog" || value == "a hedgehog") {
                    stringname =
                        "That is correct, proceeding to the next task...";
                    Future.delayed(
                      Duration(seconds: 5),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ThirdTask(),
                          ),
                        );
                      },
                    );
                  } else {
                    stringname = "That is incorrect try again";
                  }
                },
              ),
            ),
          ),
          Center(
            child: Text(
              stringname,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                child: const Text(
                  "Check your answer",
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  setState(() {
                    stringname;
                  });
                },
              ),
              padding: const EdgeInsets.all(32),
            ),
          ),
        ],
      ),
    );
  }
} //My secondtask state
