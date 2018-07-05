import 'package:flutter/material.dart';

class WidgetOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Text("Hello world",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 32.0, color: Colors.black87)),
      ),
    );
  }
}
