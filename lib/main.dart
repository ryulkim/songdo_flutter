import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MyList();
}

class _MyState extends State<MyList> {
  int _counter = 0;

  final List<int> entries = [];

  void add() {
    setState(() {
      entries.add(_counter);
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Hello Flutter"),
          ),
          body: _MyListViewWidget(entries.reversed.toList()),
          floatingActionButton: FloatingActionButton(
            onPressed: add,
            child: const Icon(Icons.add),
          ),
        ),
      );
}

class _MyListViewWidget extends StatelessWidget {
  final List<int> entries;
  final List<int> colorCodes = [900, 700, 500, 300, 100];

  _MyListViewWidget(this.entries);

  Widget build(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) => Container(
          height: 50,
          color: Colors.amber[colorCodes[entries[index] % colorCodes.length]],
          child: Center(
            child: Text('I am ${entries[index]}'),
          ),
        ),
      );
}
