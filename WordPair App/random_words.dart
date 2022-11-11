import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <String>[];
  final _savedWordPairs = Set<String>();
  final words = <String>[
    "Cat",
    "dog",
    "cow",
    "chicken",
    "sheep",
    "horse",
    "Snake",
    "Bird",
    "Pig",
    "Monkey",
    "Lion",
    "Tiger",
    "Wolf",
    "Rat",
    "Mouse",
    "Goat",
    "Bear",
    "Penguin",
    "Frog",
    "Deer",
    "Turtle",
    "Shark"
  ];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(words);
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(String pair) {
    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
        title: Text(pair, style: const TextStyle(fontSize: 18.0)),
        trailing: Icon(alreadySaved ? Icons.check_circle : Icons.done,
            color: alreadySaved ? Colors.black : null),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _savedWordPairs.remove(pair);
            } else {
              _savedWordPairs.add(pair);
            }
          });
        });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((String pair) {
        return ListTile(title: Text(pair, style: TextStyle(fontSize: 16.0)));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
          ],
        ),
        body: _buildList());
  }
}
