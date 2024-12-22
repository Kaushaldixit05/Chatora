import 'package:chatora/auth/Login_screen.dart';
import 'package:chatora/screens/Home_screen.dart';
import 'package:chatora/screens/Splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

late Size MQ;
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebae();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatora',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 1,
          titleTextStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.normal,fontSize: 23),),
          scaffoldBackgroundColor: Colors.deepPurpleAccent

      ),
     home:const SplashScreen(),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

_initializeFirebae()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}