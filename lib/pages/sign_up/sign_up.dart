import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_state/global_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vetdigital/entries/User.dart';
import 'package:vetdigital/pages/appBar/appBar.dart';
import 'package:vetdigital/pages/bottonBar/bottonBar.dart';
import 'package:vetdigital/services/authFirebase.dart';
import 'package:vetdigital/values/colors/main_colors.dart';
import 'package:vetdigital/values/textStyles/textSignUpStyle.dart';

class SignUp extends StatefulWidget{
  _StateSignUp createState()=> _StateSignUp();
}

class _StateSignUp extends State<SignUp>{

  TextEditingController phoneController=TextEditingController();

  TextEditingController fullNameController=TextEditingController();

  TextEditingController emailController=TextEditingController() ;

  TextEditingController cityController=TextEditingController();

  TextEditingController petNameController=TextEditingController();

  TextEditingController petTypeController=TextEditingController();

  TextEditingController petSubTypeController=TextEditingController();

  TextEditingController medicalHistoryController=TextEditingController();

  TextEditingController birthYearController =TextEditingController();

  TextEditingController shopController =TextEditingController();

  TextEditingController codeController=TextEditingController();

  static FirebaseAuth auth = FirebaseAuth.instance;


  File _imageOwner;

  File _imagePet;

  SharedPreferences prefs;


  @override
  void initState() {
    initPrefs();
  }
  initPrefs() async{
    prefs=await SharedPreferences.getInstance();
  }

  Future getImageOwner() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageOwner = image;
      print('Image Path $_imageOwner');
    });
  }
  Future getImagePet() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagePet = image;
      print('Image Path $_imagePet');
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cardAboutBackColor,
        body: ListView(
        children: <Widget>[
          AppBars(),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildInfo(context),
                _buildOwnerData(context),
                _buildPetData(context),
                _buildShopData(context),
                _buildButtonRegistration(context),
                SizedBox(height: 31,)
              ],
            ),
          ),
          BottomBar()
          ]
        )
    );
  }

  Widget _buildInfo(context) {
    return Container(
      height: 78,
      width: MediaQuery.of(context).size.width-60,
      margin: EdgeInsets.only(top: 50,bottom: 77),
      child: Row(
        children: <Widget>[
          Container(
            height: 78,
            width: 78,
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: cardAboutImageColor,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Image.asset("assets/images/one.png",color:borderButtons,width: 40,height: 42,fit: BoxFit.contain )
            ,
          ),
          Container(
            margin: EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Pet Owner Registration",
                  style: titleInfoH1,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Join us and start selling more",
                        style: titleInfoH2,
                        maxLines: 2,
                      ),
                      Text("products in the store!",
                        style: titleInfoH2,
                        maxLines: 2,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOwnerData(context) {
    return Container(
      width: MediaQuery.of(context).size.width-60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width-60,
            height: 86,
            margin: EdgeInsets.only(bottom: 20),
            child:  Row(
              children: <Widget>[
                Container(
                  height: 86,
                  width: 86,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardAboutImageColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: (_imageOwner!=null)?Image.file(
                    _imageOwner,
                    fit: BoxFit.fill,
                  ):Image.asset("assets/images/one.png",color:borderButtons,width: 44,height: 46,fit:BoxFit.contain )
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Owner image",
                        style: titleH1,
                      ),
                      GestureDetector(
                        onTap: (){
                          getImageOwner();
                        },
                        child:Container(
                          width: 129,
                          height: 50,
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: cardAboutBackColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff1479FF).withOpacity(0.26),
                                    offset: Offset(0,10),
                                    blurRadius: 15
                                )

                              ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 2,color: borderButtons)
                          ),
                          child: Center(
                            child: Text(
                              "Add Image",
                              style: titleH2,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:20,bottom: 20,left: 4),
            child: Text(
              "Owner",
              style: titleH1,
            ),
          ),
          _buildTextFiled("Phone",phoneController,1,true,false,context),
          _buildTextFiled("Full Name",fullNameController,1,false,false,context),
          _buildTextFiled("Email",emailController,1,false,true,context),
          _buildTextFiled("City",cityController,1,false,false,context),
        ],
      ),
    );
  }

  Widget _buildTextFiled(hint, controller,type,num,email,context){
    if(type==1)
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width-60,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 15,right: 25,top: 13),
      decoration: BoxDecoration(
          color: cardAboutBackColor,
          border: Border.all(width: 2,color: borderButtons),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff1479FF).withOpacity(0.26),
              offset: Offset(0,10),
              blurRadius: 15
            )

          ]
      ),
      child: TextField(
        style: titleH2,
        controller: controller,
        textAlign: TextAlign.left,
        onChanged: (text){
          bool validateMobile(String value) {
            if (value.length != 10)
              return false;
            else
              return true;
          }

          if(controller==phoneController){
            validateMobile(text);
          }
        },
        keyboardType: num?TextInputType.phone:email?TextInputType.emailAddress:TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
          hintText: hint,
          hintStyle: titleH2
        ),
      ),
    );
    if(type==0)
      return Container(
        height: 209,
        width: MediaQuery.of(context).size.width-60,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 25,right: 25,),
        decoration: BoxDecoration(
            color: cardAboutBackColor,
            border: Border.all(width: 2,color: borderButtons),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff1479FF).withOpacity(0.26),
                  offset: Offset(0,10),
                  blurRadius: 15
              )

            ]
        ),
        child: TextField(
          style: titleH2,
          controller: controller,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              hintText: hint,
              hintStyle: titleH2
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        )
      );
  }



  Widget _buildPetData(context) {
    return Container(
      margin: EdgeInsets.only(top: 41),
      width: MediaQuery.of(context).size.width-60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width-60,
            height: 86,
            margin: EdgeInsets.only(bottom: 20),

            child:  Row(
              children: <Widget>[
                Container(
                  height: 86,
                  width: 86,
                    padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: cardAboutImageColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: (_imagePet!=null)?Image.file(
                    _imagePet,
                    fit: BoxFit.fill,
                  ):Image.asset("assets/images/one.png",color:borderButtons,width: 44,height: 46,fit:BoxFit.contain )

                ),
                Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Pet image",
                          style: titleH1,
                        ),
                        GestureDetector(
                          onTap: (){
                            getImagePet();
                          },
                          child:Container(
                            width: 129,
                            height: 50,
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                                color: cardAboutBackColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff1479FF).withOpacity(0.26),
                                      offset: Offset(0,10),
                                      blurRadius: 15
                                  )

                                ],
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(width: 2,color: borderButtons)
                            ),
                            child: Center(
                              child: Text(
                                "Add Image",
                                style: titleH2,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:25,bottom: 26,left: 7),
            child: Text(
              "Pet",
              style: titleH1,
            ),
          ),
          _buildTextFiled("Pet Name",petNameController,1,false,false,context),
          _buildTextFiled("Pet Type",petTypeController,1,false,false,context),
          _buildTextFiled("Pet sub type",petSubTypeController,1,false,false,context),
          _buildTextFiled("Birth Year",birthYearController,1,false,false,context),
          _buildTextFiled("Medical History",medicalHistoryController,0,false,false,context),

        ],
      ),
    );
  }

  Widget _buildShopData(context) {
    return Container(
      width: MediaQuery.of(context).size.width-60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:29,bottom: 26,left: 11),
            child: Text(
              "Come from Shop",
              style: titleH1,
            ),
          ),
          _buildTextFiled("Shop Name ( dropdown )", shopController, 1,false,false,context),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width-60,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 25,right: 25,top: 13),
            decoration: BoxDecoration(
                color: cardAboutBackColor,
                border: Border.all(width: 2,color: borderButtons),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: borderButtons.withOpacity(0.26),
                      offset: Offset(0,10),
                      blurRadius: 15
                  )
                ]
            ),
            child: Text("Other",style: titleH2,),
          )
        ],
      ),
    );
  }

  Widget _buildButtonRegistration(context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          valuesCorrect(context)?null:
          showDialog(
              context: context,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: cardAboutBackColor
                  ),
                  height: 100,
                  width: 200,
                  child: FlatButton(
                    child: Text("All fields are not filled !!!",style: titleH1,),
                  ),
                ),
              )
          );
        },
        child: Container(
          height: 40,
          width: 161,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xff1479FF).withOpacity(0.26),
                    offset: Offset(0,10),
                    blurRadius: 15
                )
              ],
              color: borderButtons,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
            child: Text(
              "Registration",
              style: buttonRegistration,
            ),
          ),
        ),
      ),
    );
  }

  submitedCode(){

  }

  valuesCorrect(context){
    if(
    phoneController.text==null||phoneController.text==""||
        fullNameController.text==null||fullNameController.text==""||
        emailController.text==null||emailController.text==""||
        cityController.text==null||cityController.text==""||
        petNameController.text==null||petNameController.text==""||
        petTypeController.text==null||petTypeController.text==""||
        petSubTypeController.text==null||petSubTypeController.text==""||
        medicalHistoryController.text==null||medicalHistoryController.text!=""||
        birthYearController.text==null||birthYearController.text==""||
        shopController.text==null||shopController.text==""
    )
    {
      var user=new UserFirebase("uid", fullNameController.text,
          phoneController.text, emailController.text,
          cityController.text, petNameController.text,
          petTypeController.text, petSubTypeController.text,
          int.parse(birthYearController.text), medicalHistoryController.text,
          shopController.text
      );
      store["user"]=user;
      print("aaa");
      bool val =true;
      AuthFirebase().loginUser(phoneController.text, context,_imageOwner,_imagePet);
      return val;
    }
    else {
    Scaffold.of (context)
    .showSnackBar(SnackBar(content: Text('Processing Data')));
    return false;
    }
  }







}