import 'package:flutter/material.dart';

class MixStateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MixStateDemo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("MixStateDemo"),
        ),
        body: new ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChange(bool active) {
    setState(() {
      _active = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new TapBoxC(
      active: _active,
      onChanged: _handleTapBoxChange,
    );
  }
}

class TapBoxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxC({Key key, this.active, this.onChanged}):super(key: key);


  @override
  State<StatefulWidget> createState() {
    return new TapBoxCState();
  }
}

class TapBoxCState extends State<TapBoxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: new Container(
        child: Text(
          widget.active? "Active":"Inactive",
          style: new TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color:
          widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(color: Colors.teal[700], width: 10.0,) : null,
        ),
      ),
    );
  }
}
