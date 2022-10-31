// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

//declair player variable for audio
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
        scaffoldBackgroundColor: Colors.lightBlue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Time Attack'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TasksPage(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Text("Next"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Colors.red),
              width: 500,
              height: 150,
              child: const Center(
                child: Text(
                  "Click the simulate alarm button to start alarm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // ignore: avoid_print
              print("alarm is playing");
              await player.play(DeviceFileSource("assets/musicForapp.mp3"));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("Simulate Alarm"),
          ),
        ],
      ),
    );
  }
} //_My homepage state
//--------------------------------------------------------------------------------------------

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SecondTask(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Text("Next"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Colors.red),
              width: 500,
              height: 150,
              child: const Center(
                child: Text(
                  "How many states are there in the United States of America?",
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
                  if (value != "50") {
                    stringname = "That is incorrect";
                  } else {
                    stringname = "That is correct, go to the next task";
                  }
                },
              ),
            ),
          ),
          Center(
            child: Text(
              stringname,
              style: const TextStyle(
                color: Colors.black,
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
} //My taskspage state

//--------------------------------------------------------------------------------------------

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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ThirdTask(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Text("Next"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Colors.red),
              width: 500,
              height: 150,
              child: const Center(
                child: Text(
                  "How many continents are there?",
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
                  if (value == "7" || value == "seven") {
                    stringname = "That is correct, go to the next task";
                  } else {
                    stringname = "That is incorrect";
                  }
                },
              ),
            ),
          ),
          Center(
            child: Text(
              stringname,
              style: const TextStyle(
                color: Colors.black,
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

//--------------------------------------------------------------------------------------------

class ThirdTask extends StatefulWidget {
  const ThirdTask({super.key});

  @override
  State<ThirdTask> createState() => _ThirdTaskState();
}

class _ThirdTaskState extends State<ThirdTask> {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const Finaltask(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Text("Next"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Colors.red),
              width: 500,
              height: 150,
              child: const Center(
                child: Text(
                  "what is 8 x 7 ?",
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
                  if (value != "56") {
                    stringname = "That is incorrect";
                  } else {
                    stringname = "That is correct, go to the next task";
                  }
                },
              ),
            ),
          ),
          Center(
            child: Text(
              stringname,
              style: const TextStyle(
                color: Colors.black,
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
} //My Thirdtask state

//--------------------------------------------------------------------------------------------

class Finaltask extends StatefulWidget {
  const Finaltask({super.key});

  @override
  State<Finaltask> createState() => _FinaltaskState();
}

class _FinaltaskState extends State<Finaltask> {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const Congrats(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Text("Next"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Colors.red),
              width: 500,
              height: 150,
              child: const Center(
                child: Text(
                  "Riddle: What goes up but never comes down??",
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
                  if (value != "age") {
                    stringname = "That is incorrect";
                  } else {
                    stringname = "That is correct, press the next button!";
                  }
                },
              ),
            ),
          ),
          Center(
            child: Text(
              stringname,
              style: const TextStyle(
                color: Colors.black,
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
} //My Thirdtask state

//--------------------------------------------------------------------------------------------

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
                  "Click the home button to stop the timer and return to the home screen",
                  colors: [Colors.red, Colors.blue, Colors.black],
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
