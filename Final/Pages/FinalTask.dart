// ignore_for_file: sort_child_properties_last

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Congrats.dart';
import 'HomePage.dart';

class Finaltask extends StatefulWidget {
  const Finaltask({super.key});

  @override
  State<Finaltask> createState() => _FinaltaskState();
}

class _FinaltaskState extends State<Finaltask> {
  final _textcontroller1 = TextEditingController();
  final _textcontroller2 = TextEditingController();
  final _textcontroller3 = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Goals');
  }

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
              height: 50,
              child: const Center(
                child: Text(
                  "Write down three goals for today!",
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
            height: 10,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _textcontroller1,
                decoration: InputDecoration(
                  hintText: "Type your first goal here!",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textcontroller1.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (String value) async {},
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _textcontroller2,
                decoration: InputDecoration(
                  hintText: "Type your second goal here!",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textcontroller2.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (String value) async {},
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _textcontroller3,
                decoration: InputDecoration(
                  hintText: "Type your third goal here!",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textcontroller3.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (String value) async {},
              ),
            ),
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                child: const Text(
                  "Done",
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  Map<String, String> Goals = {
                    '1st Goal': _textcontroller1.text,
                    '2nd Goal': _textcontroller2.text,
                    '3rd Goal': _textcontroller3.text,
                  };
                  dbRef.push().set(Goals);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Congrats(),
                    ),
                  );
                },
              ),
              padding: const EdgeInsets.all(32),
            ),
          ),
        ],
      ),
    );
  }
} //My Finaltask state