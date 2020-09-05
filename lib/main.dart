import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vetdigital/pages/about/about.dart';
import 'package:vetdigital/pages/auth/HomeScreen.dart';
import 'package:vetdigital/pages/splash/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Muli'),
      home: SplaScreen(),
    );
  }
}
