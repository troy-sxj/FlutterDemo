import 'package:flutter/material.dart';


class CounterDisplay extends StatelessWidget {

  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count', textDirection: TextDirection.ltr,);
  }

}

class CounterIncrementor extends StatelessWidget {

  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed, child: new Text('Increment'),);
  }
}

class Counter extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int _counter = 0;

  void _increase() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CounterIncrementor(onPressed: _increase),
      new CounterDisplay(count: _counter),
    ],);
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'search', onPressed: null),
        ],
      ),
      body: new Center(
        child: new Counter(),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: null),
    );
  }
}
