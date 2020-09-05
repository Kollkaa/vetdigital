import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:vetdigital/entries/User.dart';
import 'package:vetdigital/pages/auth/HomeScreen.dart';
import 'package:global_state/global_state.dart';
import 'package:path/path.dart';
class AuthFirebase {
  final _codeController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  var db = Firestore.instance;

  String code;


  Future<bool> loginUser(String phone, BuildContext context,imageOwner,imagePet) async{
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{


          Navigator.of(context).pop();

          var result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if(user != null){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeScreen()
            ));
          }else{
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (var exception){
          print(exception);

        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: VerificationCodeInput(
                    keyboardType: TextInputType.number,
                    length: 6,
                    autofocus: true,
                    onCompleted: (String value) {
                      code=value;
                      print(value);
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async{
                        final code = this.code;
                        AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

                        UserCredential result = await _auth.signInWithCredential(credential);
                        print(result);
                        User user = await result.user;
                        print(user);
                        if(user != null){
                          UserFirebase us=store["user"];
                          us.uid=user.uid;
                          uploadPicOwner(imageOwner).then((value) => us.ownerImage=store['url_owner']);
                          uploadPicPet(imagePet).then((value) => us.petImage=store['url_pet']);



                          store["user"]=us;
                          getData(user.uid).then((value) {
                            store["user_uid"]= user.uid;
                            Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HomeScreen()
                              ));});
                          print(store["user_uid"]);
                        }else{
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: (String dverificationId){
          var  my1verificationId = dverificationId;
        }
    );
  }

  Future uploadPicOwner(imageOwner) async{
    String fileName = basename(imageOwner.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageOwner);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    firebaseStorageRef.getDownloadURL().then((fileURL) {

        store['url_owner']=fileURL;

    });

  }
  Future uploadPicPet(imagePet) async{
    String fileName = basename(imagePet.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imagePet);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    firebaseStorageRef.getDownloadURL().then((fileURL) {
      store['url_pet']=fileURL;

    });

  }
  Future<dynamic> getData(ui) async {
    UserFirebase us=store["user"];
     var users =   db.collection("users");

    await users.document(ui).get().then((value){
        try{
          if (value.exists) {
          print( value.data());
        } else {
            users.doc(ui).set({
              'uid': us.uid,
              'city':us.city,
              'email': us.email,
              'full_name':us.fullName,
              'pet_birth':us.petBirth,
              'pet_medical_history':us.petMedicalHistory,
              'pet_name':us.petName,
              'pet_sub_type':us.petSubType,
              'pet_type':us.petType,
              'phone':us.phone,
              'shop_name':us.shopName,
              'image': us.ownerImage,
              'pet_image':us.petImage
            });
        }
      }catch(error)
    {
      print( error);
    }

    });
  }
}