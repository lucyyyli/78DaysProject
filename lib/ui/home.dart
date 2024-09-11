import 'dart:developer' as dev;
import 'package:jiggly/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/mirror_animation_builder.dart';
import '../constants/app_theme.dart';
import '../constants/assets.dart';
import '../constants/strings.dart';
import '../widgets/app_icon_widget.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pics = [
    Assets.appLogoNoText,
    Assets.appLogoWithText,
    Assets.cat,
    Assets.alien,
    Assets.box,
    Assets.dino
  ];
  var currPic;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return _buildMainContent();
  }

  // widgets:--------------------------------------------------------------------
  Widget _buildMainContent() {
    currPic = Random().nextInt(pics.length);
    dev.log("building main content");
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppThemeData.appTheme.colorScheme.tertiary,
              AppThemeData.appTheme.colorScheme.secondary,
              AppThemeData.appTheme.colorScheme.primary,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MirrorAnimationBuilder<double>(
              tween: Tween(begin: -2.0, end: 2.0),
              // value for offset y-coordinate
              duration: const Duration(seconds: 1),

              curve: Curves.easeInOutSine,
              // non-linear animation
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value),
                  // use animated value for y-coordinate
                  child: child,
                );
              },
              child: Text(
                "78 Days",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 330,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.tertiary,
                border: Border.all(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    width: 8),
                image: DecorationImage(
                  image: AssetImage(pics[currPic]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(5.0),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    width: 5),
                color: AppThemeData.appTheme.colorScheme.tertiary,
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    currPic = Random().nextInt(3);
                  });
                },
                style: ButtonStyle(),
                child: Text(
                  "Zap!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
