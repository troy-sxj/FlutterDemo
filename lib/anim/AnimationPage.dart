import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AnimationPage',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Animation'),
        ),
        body: new LogoApp(),
      ),
    );
  }
}

class _LogoAppState extends State<LogoApp>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = new Tween(begin: 0.0, end: 300.0).animate(animationController)
    ..addStatusListener((state){
      if(state == AnimationStatus.completed){
        animationController.reverse();
      }else if(state == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedLogo(animation:  animation,);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}


class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Key key, Animation<double> animation}):super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical:  10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

}

class LogoApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _LogoAppState();
  }
}