import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Goals');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Goals');

  Widget listItem({required Map goals}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 120,
      color: const Color.fromARGB(255, 222, 147, 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            goals['1st Goal'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            goals['2nd Goal'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            goals['3rd Goal'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(goals['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map goals = snapshot.value as Map;
            goals['key'] = snapshot.key;

            return listItem(goals: goals);
          },
        ),
      ),
    );
  }
}
