import 'package:flutter/material.dart';

class PopWithDataDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "PopWithData",
      home: new HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Return Data Demo'),
      ),
      body: new Center(
        child: new SelectButton(),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {
      _navigateAndDisplaySelection(context);
    },
      child: new Text('Pick an option'),);
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new SelectionScreen()));
    
    // ignore: unnecessary_brace_in_string_interps
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('${result}')));
  }
}

class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pick an option'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yeap');
                }, child: new Text('Yeap'),),),
            new Padding(padding: EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'None');
                }, child: new Text('None'),),),
          ],
        ),
      ),
    );
  }
}