import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ListDemo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("List Demo"),
        ),
        body: new DataList(
          items: new List<String>.generate(1000, (i) => "Item $i"),
        ),
      ),
    );

//          new Column(
//            children: <Widget>[
//              new Container(
//                height: 60.0,
//                child: new ListView(
//                  scrollDirection: Axis.horizontal,
//                  children: <Widget>[
//                    new Container(
//                      width: 60.0,
//                      color: Colors.yellow,
//                    ),
//                    new Container(
//                      width: 60.0,
//                      color: Colors.blue,
//                    ),
//                    new Container(
//                      width: 60.0,
//                      color: Colors.blueGrey,
//                    ),
//                    new Container(
//                      width: 60.0,
//                      color: Colors.lightBlueAccent,
//                    ),
//                  ],
//                ),
//              ),
////              new ListView(
////                children: <Widget>[
////                  new ListTile(
////                    leading: new Icon(Icons.map),
////                    title: new Text('map'),
////                  ),
////                  new ListTile(
////                    leading: new Icon(Icons.album),
////                    title: new Text('album'),
////                  ),
////                  new ListTile(
////                    leading: new Icon(Icons.phone),
////                    title: new Text('phone'),
////                  ),
////                ],
////              ),
//            ],
//          )),
//    );
  }
}

class DataList extends StatelessWidget {
  final List<String> items;

  DataList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(items[index]),
          );
        });
  }
}
