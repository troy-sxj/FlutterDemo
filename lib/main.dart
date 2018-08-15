import "package:flutter/material.dart";
import 'package:flutter_app/DetailPage.dart';
import 'package:flutter_app/tutorial/FriendlyChatPage.dart';
//引用material组件

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final List<String> itemList = const <String>['FrindlyChat'];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Demo",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Welcome to flutter"),
          ),
          body: new Container(
              child: new ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              new ListItemView(
                title: 'FrindlyChat',
                routeUrl: '/a',
              ),
            ],
          ))),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => new FriendlyChatPage(),
        '/b': (BuildContext context) => new DetailPage(),
        '/c': (BuildContext context) => new DetailPage(),
      },
    );
    //
  }
}

class ListItemView extends StatelessWidget {
  final String title;
  final String routeUrl;

  ListItemView({Key key, this.title, this.routeUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeUrl);
      },
      child: new Container(
        alignment: Alignment.center,
        color: Colors.blue,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Text(
          title,
          style: new TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}
