import 'package:flutter/material.dart';
import 'package:vetdigital/values/colors/main_colors.dart';
import 'package:vetdigital/values/textStyles/textAboutStyle.dart';

class BottomBar extends StatefulWidget{

  _StateBottomBar createState()=> _StateBottomBar();
}

class _StateBottomBar  extends State<BottomBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 76,
        color: bottomNavigationColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("About",style: bottomTextStyle,),
            Text("© VETDigital 2020",style: bottomTextStyle,),
            Text("Privacy",style: bottomTextStyle,)

          ],
        )
    );
  }

}
