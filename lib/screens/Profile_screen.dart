import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatora/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/apis.dart';
import '../main.dart';
import '../models/chat_user.dart';

class Profilescreen extends StatefulWidget {
  final ChatUser user;
  const Profilescreen({super.key, required this.user});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Profile Screen",),
          backgroundColor: Colors.purpleAccent,

        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20,right: 10),

          child: FloatingActionButton(
            backgroundColor: Colors.purpleAccent,

            onPressed: ()async{

            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },child: const Icon(Icons.exit_to_app,),),

        ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal:MQ.width*0.25),
        child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MQ.height*0.3),
            child :CachedNetworkImage(
              width: MQ.height*0.255,
              height: MQ.height*0.255,
              fit: BoxFit.fill,
              imageUrl: widget.user.image,
              //placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person),),
            ),),
            Text(widget.user.email,style: const TextStyle(color:Colors.white,fontSize: 11,backgroundColor: Colors.blueAccent,),),
              SizedBox(
            height: MQ.height*0.05,
            ),
          TextFormField(

              initialValue: widget. user.name,
              decoration: InputDecoration(label: Text("eg. Kaushal DIxit",style: TextStyle(color:Colors.purpleAccent),),prefixIcon: Icon(Icons.person,color: Colors.purpleAccent),hoverColor: Colors.white70, border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
            ),
          SizedBox(
            height: MQ.height*0.05,
          ),
          TextFormField(
            initialValue: widget. user.about,style:TextStyle(color:Colors.lightBlueAccent,),
            decoration: InputDecoration(label: Text("eg.About",style: TextStyle(color:Colors.purpleAccent)),prefixIcon: Icon(Icons.info_outline,color: Colors.purpleAccent,),hoverColor: Colors.white70, border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
          )
        ],
      ),),
    );

  }
}
