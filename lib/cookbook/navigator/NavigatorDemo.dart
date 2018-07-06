import 'package:flutter/material.dart';
import 'package:flutter_app/cookbook/navigator/MyPageRoute.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Navigator Demo",
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FirstScreen"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("Launch new screen"),
            onPressed: () {
              Navigator.push(context,
                  new MyPageRoute(builder: (context) => new SecondScreen()));
            }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SecondScreen"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("Go Back"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
