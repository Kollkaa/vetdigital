import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vetdigital/pages/appBar/appBar.dart';
import 'package:vetdigital/pages/bottonBar/bottonBar.dart';
import 'package:vetdigital/pages/sign_up/sign_up.dart';
import 'package:vetdigital/values/colors/main_colors.dart';
import 'package:vetdigital/values/textStyles/textAboutStyle.dart';

class AboutPage extends StatefulWidget{

   _StateAboutPage createState()=>_StateAboutPage();
}
class _StateAboutPage extends State<AboutPage>{


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: <Widget>[
            AppBars(),
            Container(
                padding: EdgeInsets.only(left: 17,right: 17),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.5),
                        BlendMode.dstATop),
                    image: AssetImage("assets/images/home.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    _buildTitle1(),
                    _buildTitle2(),
                    _buildButtonContact(),
                    _buildCards(),
                    _buildBottonCards()
                  ],
                )
            ),
            BottomBar()
          ],
        ),
      );

  }
  Widget _buildTitle1(){
    return Container(
      margin: EdgeInsets.only(left: 27,top: 15),
      width: MediaQuery.of(context).size.width*0.5,
      child: Text(
          "Advanced And Professional Veterinary"
          ,style: titleH1TextStyle

      ),
    );
  }

  Widget _buildTitle2(){
    return Container(
      margin: EdgeInsets.only(top: 7,left: 27),
      width: MediaQuery.of(context).size.width*0.7,
      child: Text(
          "We believe in prudent and deliberate."
          ,style: titleH2TextStyle

      ),
    );
  }

  Widget _buildButtonContact(){
    return Container(
      width: 161,
      height: 40,

      decoration: BoxDecoration(
          color: borderButtons,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.only(left: 27,top: 22),
      child: GestureDetector(
        child: Center(

          child: Text("Contact Us",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13,color: Colors.white),),
        ),
      ),
    );
  }

  Widget _buildCards(){
    return Container(
      margin: EdgeInsets.only(top: 38,bottom: 27),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              _buildCard("Pet","Owner","one"),
              _buildCard("Shop","Owner","second")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              _buildCard("Veterinaty","","third"),
              _buildCard("Maternity","Hospital","fouth")
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottonCards(){
    return Container(
      height: 84,
      margin: EdgeInsets.only(bottom: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(

            height: 54,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: cardAboutImageColor,

            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 5,left: 5,bottom: 4),
            child: Image.asset("assets/images/third.png",color: Colors.blue),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("1 Year Subscriptions",style: bottonCardTextStyleH1,),
                Text("Join us and increase the",style: bottonCardTextStyleH2,),
                Text("number of customers!",style: bottonCardTextStyleH2,),
              ],
            ),
          ),
          Container(

              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color:borderButtons,width: 2),

              ),
              child:Center(
                child: Text("Info",
                  textAlign: TextAlign.center,
                  style: bottonCardButtonTextStyle,),

              ))
        ],
      ),
    );
  }


  Widget _buildCard(text1,text2,num){
    print(MediaQuery.of(context).size.height.toString());
    return Container(
      height: 115,
      width: MediaQuery.of(context).size.width*0.44,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))

      ),
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 14,left: 10),
                height: MediaQuery.of(context).size.width*0.15,
                width: MediaQuery.of(context).size.width*0.16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: cardAboutImageColor,
                ),
                padding: EdgeInsets.all(10),

                child: Image.asset("assets/images/${num}.png",color: borderButtons),
              ),
              Container(
                padding: EdgeInsets.only(left: 5,right: 5 ),
                margin: EdgeInsets.only(top:11),
                width: MediaQuery.of(context).size.width*0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(text1+"           "+text2,style: cardTextStyle,textAlign: TextAlign.center,),
                    SizedBox(height: 1,),
                    Text("Join us",style: cardTextBotStyle),


                  ],
                ),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 8,bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width*0.22,
                      padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                          color:cardAboutBackColor,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          border:Border.all(color: Color.fromRGBO(20, 121, 255, 1),width: 1)
                      ),
                      child: Center(
                        child: Text("Register",style: buttonCardTextStyle,textAlign: TextAlign.center,),
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

  }

}
