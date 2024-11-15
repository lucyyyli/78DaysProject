import 'package:jiggly/constants/app_theme.dart';
import 'package:jiggly/constants/strings.dart';
import 'package:jiggly/ui/home.dart';
import 'package:jiggly/ui/splash.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: AppThemeData.appTheme,
      home: HomeScreen(),
      // splash: SplashScreen(),
    );
  }
}
