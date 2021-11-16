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
  //int _counter = 0;

  final List<String> entries = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  void add(String value) {
    setState(() {
      entries.add(value);
      //_counter++;
    });
  }

  Widget _buildInput() {
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(hintText: "Input Anything"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Value is Empty";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Hello Flutter"),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(24),
                height: 150,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildInput(),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => {
                                if (!_formKey.currentState!.validate())
                                  {}
                                else
                                  {
                                    add(_controller.text),
                                    _controller.text = "",
                                  }
                              },
                          child: const Text("submit")),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(24),
                height: 360,
                child: _MyListViewWidget(entries.reversed.toList()),
              )
            ],
          ),
          /*floatingActionButton: FloatingActionButton(
            onPressed: add(_controller.text),
            child: const Icon(Icons.add),
          ),*/
        ),
      );
}

class _MyListViewWidget extends StatelessWidget {
  final List<String> entries;
  final List<int> colorCodes = [900, 700, 500, 300, 100];

  _MyListViewWidget(this.entries);

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) => Container(
          height: 50,
          color: Colors.amber[colorCodes[index % colorCodes.length]],
          child: Center(
            child: Text(entries[index]),
          ),
        ),
      );
}
