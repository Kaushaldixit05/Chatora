import 'dart:convert';
import 'dart:developer';

import 'package:chatora/screens/Profile_screen.dart';
import 'package:chatora/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/apis.dart';
import '../models/chat_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser>list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>Profilescreen(user:list[0])));
            
          }, icon: Icon(Icons.more_vert))
        ],
        centerTitle: true,
        elevation: 1,
        title: Text('Chatora',
          style: TextStyle(color:Colors.white,fontWeight: FontWeight.normal,fontSize: 23),),
        backgroundColor: Colors.purpleAccent,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20,right: 10),

        child: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add_comment_rounded),),

      ),
    body:  StreamBuilder(stream: APIs.firestore.collection('users').snapshots(), builder: (context,snapshot){
      switch(snapshot.connectionState){
        case ConnectionState.waiting:
        case ConnectionState.none:
          return const Center(child: CircularProgressIndicator(),);
         case ConnectionState.active:
         case ConnectionState.done:
      }

      if(snapshot.hasData){
        final data = snapshot.data?.docs;
        list = data?.map((e)=>ChatUser.fromJson(e.data())).toList()??[];
      }
     if(list.isNotEmpty){
       return ListView.builder(itemCount: list.length,physics: BouncingScrollPhysics(),
           itemBuilder: (context,index){return ChatUserCard(user:list[index]);}
       );
     }else{
       return const Center(child: Text('No Connection Found !',style: TextStyle(fontSize: 20),));
     }
    })
    );
      
  }
}
