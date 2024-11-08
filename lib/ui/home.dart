import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    Assets.img_6738,
    Assets.img_6737,
    Assets.img_6739,
    Assets.img_6740,
    Assets.img_6741,
    Assets.img_6742,
    Assets.img_6743,
    Assets.img_6744,
    Assets.img_6745,
    Assets.img_6747,
    Assets.img_6748,
    Assets.img_6750,
    Assets.img_6751,
  ];
  var unusedPics = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
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
                  "Multiverse Explorer",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
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
                    spreadRadius: 5,
                    blurRadius: 0,
                    offset: Offset(-2, 2), // changes position of shadow
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(pics[currPic]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: 230,
                  decoration: BoxDecoration(
                    color: AppThemeData.appTheme.colorScheme.tertiary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            AppThemeData.appTheme.colorScheme.tertiaryContainer,
                        spreadRadius: 5,
                        blurRadius: 0,
                        offset: Offset(-2, 2), // changes position of shadow
                      )
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        dev.log("unused length:" +
                            unusedPics.length.toString() +
                            "used length: " +
                            usedPics.length.toString());
                        if (unusedPics.length == 0) {
                          unusedPics = usedPics;
                          usedPics = <int>[];
                        }
                        if (unusedPics.length == pics.length) {
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
                          dev.log("unused length:" +
                              unusedPics.length.toString() +
                              "used length: " +
                              usedPics.length.toString());
                        }
                      });
                    },
                    style: ButtonStyle(),
                    child: Text(
                      "New Variant",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppThemeData.appTheme.colorScheme.tertiary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            AppThemeData.appTheme.colorScheme.tertiaryContainer,
                        spreadRadius: 5,
                        blurRadius: 0,
                        offset: Offset(-2, 2), // changes position of shadow
                      )
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      dev.log("Info button pressed");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return infoDialog();
                        },
                      );
                    },
                    style: ButtonStyle(),
                    child: Text(
                      "Info",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoDialog() {
    return AlertDialog(
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.montserrat(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.surface),
          children: <TextSpan>[
            TextSpan(text: "What is this?"),
          ],
        ),
      ),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      contentTextStyle: Theme.of(context).textTheme.titleSmall,
      content: Container(
          height: 235,
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.surface),
              children: <TextSpan>[
                TextSpan(
                  text: '变',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: ': To change, transform, become.\n\n',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(text: 'Inspired by the wacky alternate universes of '),
                TextSpan(
                  text: 'Everything Everywhere All at Once',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(
                    text:
                        ', explore the variants of 变 through the vast and absurd multiverse.'),
              ],
            ),
          )),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.surface),
              children: <TextSpan>[
                TextSpan(text: "Start exploring"),
                ],
            ),
          ),
        ),
      ],
    );
  }
}
