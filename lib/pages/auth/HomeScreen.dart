import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_state/global_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vetdigital/entries/User.dart';

class HomeScreen extends StatefulWidget {

  _StateHomeScreen createState()=>_StateHomeScreen();
}

class _StateHomeScreen  extends State<HomeScreen>{
  SharedPreferences prefs;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Image.network(store['user'].ownerImage??"")
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    initPrefs();
  }

  initPrefs() async{
    prefs=await SharedPreferences.getInstance();
  }
}