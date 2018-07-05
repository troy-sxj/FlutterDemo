import 'package:flutter/material.dart';

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
      home: new MyHomePage(title: appName,),
    );
  }

}

class MyHomePage extends StatelessWidget {

  final String title;

  MyHomePage({Key key, @required this.title}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: new Center(
        child: new Container(
          color: Theme
              .of(context)
              .accentColor,
          child: new Text("Text with background color",
            style: Theme
                .of(context)
                .textTheme
                .title,),
        ),
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: new FloatingActionButton(
            onPressed: null, child: new Icon(Icons.add),)),
    );
  }

}