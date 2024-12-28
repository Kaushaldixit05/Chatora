import 'package:chatora/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatora/auth/Login_screen.dart';

import '../main.dart';
class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key, required this.user});
  final ChatUser user;
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.purple.shade100,
      elevation: 10,
      child: InkWell(
        onTap: (){},

        child: ListTile(
          //leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          selectedColor:Colors.blue ,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(MQ.height*0.3),
            child :CachedNetworkImage(
            width: MQ.height*0.55,
            height: MQ.height*0.55,
            imageUrl: widget.user.image,
            //placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person),),
          ),),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.about,maxLines: 1,),
          trailing: Text('10:30 PM',style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
