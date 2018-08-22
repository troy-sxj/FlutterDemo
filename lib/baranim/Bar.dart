import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter_app/baranim/ColorPalette.dart';

class Bar {
  final double height;
  final Color color;

  Bar(this.height, this.color);

  static Bar lerp(Bar begin, Bar end, double t) {
    return Bar(lerpDouble(begin.height, end.height, t),
        Color.lerp(begin.color, end.color, t));
  }
}

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

  @override
  Bar lerp(double t) {
    return Bar.lerp(begin, end, t);
  }
}

class BarChart {
  static const int barCount = 5;

  final List<Bar> bars;

  BarChart(this.bars) {
    assert(bars.length == barCount);
  }

  factory BarChart.empty() {
    return BarChart(List.filled(barCount, Bar(0.0, Colors.transparent)));
  }

  factory BarChart.random(Random random) {
    final Color color = ColorPalette.primary.random(random);
    return BarChart(List.generate(
        barCount, (i) => Bar(random.nextDouble() * 100.0, color)));
  }

  static BarChart lerp(BarChart begin, BarChart end, double t) {
    return BarChart(List.generate(
      barCount,
      (i) => Bar.lerp(begin.bars[i], end.bars[i], t),
    ));
  }
}

class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end);

  @override
  BarChart lerp(double t) {
    return BarChart.lerp(begin, end, t);
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidthFraction = 0.75;

  final Animation<BarChart> animation;

  BarChartPainter(Animation<BarChart> animation)
      : animation = animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    void drawBar(Bar bar, double x, double width, Paint paint) {
      paint.color = bar.color;
      canvas.drawRect(
          Rect.fromLTWH(x, size.height - bar.height, width, bar.height), paint);
    }

    final paint = Paint()..style = PaintingStyle.fill;
    final chart = animation.value;
    final barDistance = size.width / (1 + chart.bars.length);
    final barWidth = barDistance * barWidthFraction;
    var x = barDistance - barWidth / 2;
    for (final bar in chart.bars) {
      drawBar(bar, x, barWidth, paint);
      x += barDistance;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
