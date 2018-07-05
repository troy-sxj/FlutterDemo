import 'package:flutter/material.dart';

class TapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "TapDemo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("TapDemo"),
        ),
        body: new DismissableListView(items: new List<String>.generate(100, (i) => "Item ${i + 1}")),
      ),
    );
  }
}

class TapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Text("Button"),
      ),
    );
  }
}

class InkWellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: EdgeInsets.all(12.0),
        child: new Text("Button"),
      ),
    );
  }
}

class DismissableListView extends StatelessWidget {
  final List<String> items;

  DismissableListView({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return new Dismissible(
              key: new Key(item),
              onDismissed: (direction) {
                items.removeAt(index);
                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: new Text("$item dismiss")));
              },
              direction: DismissDirection.endToStart,
              background: new Container(
                color: Colors.red,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                alignment: Alignment.centerRight,
                child: new Text('Delete'),
              ),
              child: new ListTile(
                title: new Text('$item'),
              ));
        });
  }
}
