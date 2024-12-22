import 'package:chatora/screens/Home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isAnimate =false;
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(milliseconds: 500),(){
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
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
          Positioned(
            top: MQ.height*.15,width: MQ.width*.5,left: MQ.width*.25,
            child:Image.asset('images/icon.png'),

          ),

          Positioned(
              bottom:  MQ.height*.15,width: MQ.width*.9,left: MQ.width*.35,
              child:const Text("Made by KD",style: TextStyle(fontSize: 25,color: Colors.lightBlueAccent),),),
        ],
      ),
    );

  }
}
