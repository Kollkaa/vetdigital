import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_state/global_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vetdigital/entries/User.dart';
import 'package:vetdigital/pages/splash/splashScreen.dart';
import 'package:vetdigital/values/colors/main_colors.dart';

class HomeScreen extends StatefulWidget {

  _StateHomeScreen createState()=>_StateHomeScreen();
}

class _StateHomeScreen  extends State<HomeScreen>{
  SharedPreferences prefs;
  UserFirebase user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully  "+user.petName, style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),

            FlatButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                prefs.setString("user", null);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SplaScreen()));
                },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderButtons,
                    width: 2
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(
                  child: Text(
                      "SingOut"
                  ),
                )
              ),
            )
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
    setState(() {
    user=UserFirebase.fromJson(json.decode(prefs.getString("user")));
    });
  }
}