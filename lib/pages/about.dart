import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(79.0),
        child:Container(
          height: 79,
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromRGBO(243, 248, 255,1)
                    ),
                    padding: EdgeInsets.all(13),
                    margin: EdgeInsets.only(top: 17,left: 15,bottom: 16),
                    child: Icon(Icons.phone,color: Colors.blue,size: 25,),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("VET",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color.fromRGBO(25, 59, 104, 1)),),
                      Text("Digital",style: TextStyle(fontSize: 27,fontWeight: FontWeight.normal,color: Color.fromRGBO(25, 59, 104, 1)))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 27,right: 17,bottom: 27),
                    child: Icon(Icons.menu,color: Colors.blue,size: 32,),
                  )

                  ],
              )
          ),
      ),
      body: Container(
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
        height: MediaQuery.of(context).size.height-60,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 24,top: 15),
              width: MediaQuery.of(context).size.width*0.5,
              child: Text(
                  "Advanced And Professional Veterinary"
                  ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromRGBO(25, 59, 104, 1))

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7,left: 24),
              width: MediaQuery.of(context).size.width*0.7,
              child: Text(
                  "We believe in prudent and deliberate."
                  ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Color.fromRGBO(25, 59, 104, 1))

              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 27,top: 12),
              child: GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.45,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 121, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text("Contact Us",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13,color: Colors.white),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14,bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      _buildCard("Pet","Owner","one",25.0,25.0),
                      _buildCard("Shop","Owner","second",25.0,25.0)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      _buildCard("Veterinaty","","third",35.0,35.0),
                      _buildCard("Maternity","Hospital","fouth",25.0,25.0)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 84,
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
                      color: Color.fromRGBO(243, 248, 255, 1),
                    ),
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset("assets/images/third.svg",color: Colors.blue,width: 31,height: 38,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("1 Year Subscriptions",style: TextStyle( fontSize:19,fontWeight: FontWeight.bold,color: Color.fromRGBO(25, 59, 104, 1)),),
                      Text("Join us and increase the",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Color.fromRGBO(25, 59, 104, 1)),),
                      Text("number of customers!",style: TextStyle(fontSize:13,fontWeight: FontWeight.normal,color: Color.fromRGBO(25, 59, 104, 1)),),
                    ],
                  ),
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color:Color.fromRGBO(20, 121, 255, 1),width: 2),
                        color: Color.fromRGBO(243, 248, 255, 1),
                      ),
                      child:Center(
                        child: Text("Info",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Color.fromRGBO(20, 121, 255, 1)),),

                      ))
                ],
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 76,
        color: Color.fromRGBO(221, 232, 248, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("About",style: TextStyle(fontSize: 12),),
            Text("© VETDigital 2020",style: TextStyle(fontSize: 12),),
            Text("Privacy",style: TextStyle(fontSize: 12),)

          ],
        )
      ),



    );

  }
  _buildCard(text1,text2,num,width,height){
    print(MediaQuery.of(context).size.height.toString());
    return Container(
      height: 90,
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
                margin: EdgeInsets.only(top: 5),
                height: 55,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Color.fromRGBO(243, 248, 255, 1),
                ),
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset("assets/images/${num}.svg",color: Colors.blue,width: 34,height: 41,),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(text1,style: TextStyle(fontSize:13,fontWeight: FontWeight.bold,color: Color.fromRGBO(25, 59, 104, 1)),),
                    Text(text2,style: TextStyle(fontSize:13,fontWeight: FontWeight.bold,color: Color.fromRGBO(25, 59, 104, 1)),),
                    Text("Join us",style: TextStyle(fontSize:17,fontWeight: FontWeight.normal,color: Color.fromRGBO(25, 59, 104, 1))),


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
                      padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          border:Border.all(color: Color.fromRGBO(20, 121, 255, 1))
                      ),
                      child: Text("Register",style: TextStyle(fontSize:11,fontWeight: FontWeight.normal,color: Color.fromRGBO(20, 121, 255, 1)))
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