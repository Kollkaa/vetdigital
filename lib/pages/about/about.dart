import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vetdigital/values/colors/main_colors.dart';
import 'package:vetdigital/values/textStyles/textAboutStyle.dart';

class AboutPage extends StatefulWidget{

  _StateAboutPage createState()=>_StateAboutPage();
}
class _StateAboutPage extends State<AboutPage>{
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_appBar(),
      body: ListView(
          children: <Widget>[
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
            _buildBottom()
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
      margin: EdgeInsets.only(left: 27,top: 22),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width*0.45,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: cardAboutImageBackColor,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
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
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: 5,left: 5,bottom: 4),
            child: SvgPicture.asset("assets/images/third.svg",color: Colors.blue,width: 31,height: 38,),
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
                border: Border.all(color:cardAboutImageBackColor,width: 2),

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
  Widget _buildBottom() {
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
                padding: EdgeInsets.all(5),

                child: SvgPicture.asset("assets/images/${num}.svg",color: cardAboutImageBackColor,width: 34,height: 41,),
              ),
              Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                margin: EdgeInsets.only(top:21),
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
                  child: Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width*0.22,
                      padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                          color:cardAboutBackColor,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          border:Border.all(color: Color.fromRGBO(20, 121, 255, 1))
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



  Widget _appBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(79.0),
      child:Container(
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
      child: Icon(Icons.phone,color: cardAboutImageBackColor,size: 25,),
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
      child: Icon(Icons.menu,color: cardAboutImageBackColor,size: 32,),
    );
  }

}