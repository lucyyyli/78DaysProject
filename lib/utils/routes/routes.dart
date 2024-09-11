import 'package:jiggly/ui/home.dart';
import 'package:jiggly/ui/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(),

  };
}
