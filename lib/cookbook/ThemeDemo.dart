import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = "Theme Demo";
    return MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[500],
        accentColor: Colors.cyan[500],
      ),
      home: new MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new CircularProgressIndicator(),
          ),
          new Center(
            child: new CachedNetworkImage(
              placeholder: new CircularProgressIndicator(),
              imageUrl:
                  'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
            ),
          )
        ],
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.add),
          )),
    );
  }
}
