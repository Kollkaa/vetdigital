import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetdigital/pages/about/about.dart';
import 'package:vetdigital/values/colors/main_colors.dart';
import 'package:vetdigital/values/textStyles/textSplashScreenStyele.dart';
import 'dart:async';

class SplaScreen extends StatefulWidget{
  _StateSplashScreen createState()=> _StateSplashScreen();
}

class _StateSplashScreen extends State<SplaScreen>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardAboutBackColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                tileMode: TileMode.repeated,
                  colors: [borderButtons, splashScreenLogo],
              )),

          width: 170,
          height: 170,
          child: Center(
            child: Text(
              "VET",
              style: logoTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}