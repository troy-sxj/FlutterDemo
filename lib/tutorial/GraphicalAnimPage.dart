//import 'package:flutter/material.dart';
//
//import 'dart:ui' show lerpDouble;
//
//class GraphicalAnimPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return null;
//  }
//}
//
//class Bar {
//
//  final double height;
//  final Color color;
//
//  Bar(this.height, this.color);
//
//  static Bar lerp(Bar begin, Bar end, double t){
//    return Bar(lerpDouble(begin.height, end.height, t), Color.lerp(begin.color, end.color, t));
//  }
//}
//
//class BarTween extends Tween<Bar>{
//
//  BarTween(Bar begin, Bar end):super(begin:begin, end:end);
//
//  @override
//  Bar lerp(double t) {
//    return Bar.lerp(begin, end, t);
//  }
//}