import 'package:flutter/material.dart';

class MyPageRoute<T> extends MaterialPageRoute<T>{

  MyPageRoute({WidgetBuilder builder, RouteSettings settings}):super(builder: builder, settings:settings);


  //重写buildTransitions，实现自定义页面切换动画
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if(settings.isInitialRoute){
      return child;
    }
    return new FadeTransition(opacity: animation, child: child,);
  }
}