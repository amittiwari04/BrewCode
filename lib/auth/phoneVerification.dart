import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myshop/auth/auth.dart';
//import 'package:myshop/auth/databse.dart';
import 'package:myshop/screens/otp.dart';

class MobileOtpScreen extends StatefulWidget {
  final String phoneno;

  MobileOtpScreen({this.phoneno});

  @override
  _MobileOtpScreenState createState() => _MobileOtpScreenState();
}

class _MobileOtpSc  reenState extends State<MobileOtpScreen> {
  AuthService _auth = AuthService();
  bool isCodeSend = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _verificationId;
  PinDecoration pinDecoration =
      UnderlineDecoration(hintText: '123456', color: Colors.black);
  TextEditingController _pinTextExitingController = TextEditingController();
  bool isLoading = false;
//
//  void onFormSubmitted() async {
//    AuthCredential _authCredential = PhoneAuthProvider.credential(
//        verificationId: _verificationId, smsCode: _pinTextExitingController.text);
//
//    UserCredential user= await _firebaseAuth.signInWithCredential(_authCredential);
//    _firebaseAuth.signInWithCredential(_authCredential).then((UserCredential value)async{
//
//      if(value.user!=null){
//        //deakhte h
//        setState(() {
//          isLoading=true;
//        });
//      }
//     _auth.signInWithPhone(_authCredential);
//
//      await DataBaseService(uid: user.uid).updateUserData("0", 100, "new user");
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
