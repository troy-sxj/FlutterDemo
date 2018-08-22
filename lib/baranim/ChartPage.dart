import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/baranim/Bar.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ChartPage',
      home: new ChartPageView(),
    );
  }
}

class ChartPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartPageSate();
  }
}

class ChartPageSate extends State<ChartPageView> with TickerProviderStateMixin {
  final random = Random();
  AnimationController animationController;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));

//    tween = BarTween(new Bar(30.0, Colors.lightBlueAccent), new Bar(100.0, Colors.red));
    tween = BarChartTween(BarChart.empty(), BarChart.random(random));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('ChartPage')),
      body: new Center(
        child: CustomPaint(
          size: Size(200.0, 100.0),
          painter: BarChartPainter(tween.animate(animationController)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeData,
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = BarChartTween(
          tween.evaluate(animationController), BarChart.random(random));
      animationController.forward(from: 0.0);
    });
  }
}
