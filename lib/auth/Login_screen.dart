import 'dart:developer';
import 'dart:io';

import 'package:chatora/api/apis.dart';
import 'package:chatora/helper/dialogs.dart';
import 'package:chatora/screens/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isAnimate =false;
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(milliseconds: 500),(){
      setState(() {
        _isAnimate = true;
      });
    });
  }
  _handleGoogleButtonClick(){

    _signInWithGoogle().then((user) async {
      if(user!=null){
        if(await APIs.userExists()){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
        }
       else{
         APIs.createUser().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
      });
      }

      }
    });
  }
  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the authentication flow
    try{
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      log('\n_signinwithgoogle:$e');
      Dialogs.showSnackBar(context, "Check Internet please");
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {

    MQ = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: Text('Welcome To Chatora',
            style: TextStyle(color:Colors.white,fontWeight: FontWeight.normal,fontSize: 23),),
          backgroundColor: Colors.purpleAccent,
        ),
      body: Stack(
        children: [
         AnimatedPositioned(
           top: MQ.height*.15,width: MQ.width*.5,right: _isAnimate?MQ.width*.25:-MQ.width*.5,
           child:Image.asset('images/icon.png'),
            duration: const Duration(seconds: 1),
         ),

          Positioned(
            bottom:  MQ.height*.15,width: MQ.width*.9,height: MQ.height*.05,left:MQ.width*0.05,
            child:ElevatedButton.icon( onPressed: (){_handleGoogleButtonClick();},icon: Image.asset("images/google.png"), label: Text("Login with Google")) )
        ],
      ),
    );

  }
}
