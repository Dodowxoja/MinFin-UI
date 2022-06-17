import 'package:flutter/material.dart';
import 'package:ui/view/my_home_view.dart';

class MyRoutes {
  static final MyRoutes _instanse = MyRoutes.init();
  static MyRoutes get instanse => MyRoutes._instanse;
  MyRoutes.init();

  Route? onGenerate(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/my_home_view':
        return MaterialPageRoute(builder: (_) => const MyHomeView());
   }
  }
}