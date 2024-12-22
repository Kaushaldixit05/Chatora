import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
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

      ));

  }
}
