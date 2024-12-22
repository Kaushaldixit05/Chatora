import 'package:chatora/screens/Home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            child:ElevatedButton.icon( onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));},icon: Image.asset("images/google.png"), label: Text("Login with Google")) )
        ],
      ),
    );

  }
}
