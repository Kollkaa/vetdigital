import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetdigital/values/colors/main_colors.dart';
import 'package:vetdigital/values/textStyles/textAboutStyle.dart';

class AppBars extends StatefulWidget{

  _StateAppBars createState()=>_StateAppBars();
}

class _StateAppBars  extends State<AppBars>{
  @override
  Widget build(BuildContext context) {
    return _appBar(MediaQuery.of(context).size.width);
  }
  Widget _appBar(width){
    return Container(
      height: 79.0,
      width: width,
      child:Container(
          color: cardAboutBackColor,
          height: 79,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _phone(),
              _title(),
              _menu()
            ],
          )
      ),
    );
  }

  Widget _phone(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(243, 248, 255,1)
      ),
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.only(top: 17,left: 15,bottom: 16),
      child: Icon(Icons.phone,color: borderButtons,size: 25,),
    );
  }

  Widget _title(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("VET",style: appbarH1TextStyle),
        Text("Digital",style: appbarH2TextStyle)
      ],
    );
  }

  Widget _menu(){
    return Container(
      margin: EdgeInsets.only(top: 27,right: 17,bottom: 27),
      child: Icon(Icons.menu,color: borderButtons,size: 32,),
    );
  }
}