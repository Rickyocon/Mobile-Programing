import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/round-button.dart';
import 'LoginPage.dart';
import 'StatsPage.dart';
import 'TaskPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  Future<void> notify() async {
    if (countText == '0:00:00') {
      // ignore: avoid_print
      print("alarm is playing");
      await player.play(DeviceFileSource("assets/musicForapp.mp3"));
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TasksPage(),
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Create Alarm'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 8, 77, 133)),
                child: Text(
                  'Options',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Goals Page',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StatsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    value: progress,
                    strokeWidth: 6,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                    icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: RoundButton(
                    icon: Icons.stop,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
