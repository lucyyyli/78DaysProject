import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/mirror_animation_builder.dart';
import '../constants/app_theme.dart';
import '../constants/assets.dart';
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
  var unusedPics = [1, 2, 3, 4, 5];
  var usedPics = <int>[0];
  var currPic = 0;

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
    dev.log("building main content");
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MirrorAnimationBuilder<double>(
                tween: Tween(begin: -2.0, end: 2.0),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOutSine,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: child,
                  );
                },
                child: Text(
                  "78 Days",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                  // style: TextStyle(
                  //   shadows: <Shadow>[
                  //     Shadow(
                  //       offset: Offset(-3.0, 3.0),
                  //       blurRadius: 3.0,
                  //       color: Theme.of(context).colorScheme.secondaryContainer,
                  //     ),
                  //     Shadow(
                  //       offset: Offset(-3.0, 3.0),
                  //       blurRadius: 8.0,
                  //       color: Color.fromARGB(125, 0, 0, 255),
                  //     )
                  //   ],
                  //   color: Theme.of(context).colorScheme.primaryContainer,
                  //   // fontStyle: Theme.of(context).textTheme.headlineLarge,
                  // ),
                )),
            SizedBox(height: 30),
            Container(
              height: 330,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 10),
                boxShadow: [
                  BoxShadow(
                    color: AppThemeData.appTheme.colorScheme.primaryContainer,
                    spreadRadius: 4,
                    blurRadius: 0,
                    offset: Offset(-2, 3), // changes position of shadow
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(pics[currPic]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(5.0),
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppThemeData.appTheme.colorScheme.tertiaryContainer,
                    spreadRadius: 3,
                    blurRadius: 0,
                    offset: Offset(-2, 3), // changes position of shadow
                  )
                ],
                color: AppThemeData.appTheme.colorScheme.tertiary,
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    dev.log("unused length:" + unusedPics.length.toString() +
                        "used length: " + usedPics.length.toString());
                    if (unusedPics.length == 0) {
                      unusedPics = usedPics;
                      usedPics = <int>[];

                    }
                    if (unusedPics.length == 6) {
                      currPic = 0;
                      usedPics.add(0);
                      unusedPics.remove(0);
                      dev.log("currPic: " + currPic.toString());
                    } else {
                      var random = Random().nextInt(unusedPics.length);
                      currPic = unusedPics[random];
                      dev.log("currPic: " + currPic.toString());
                      unusedPics.removeAt(random);
                      usedPics.add(currPic);
                      dev.log("unused length:" + unusedPics.length.toString() +
                          "used length: " + usedPics.length.toString());
                    }
                  });
                },
                style: ButtonStyle(),
                child: Text(
                  "Get Groovy!",
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
