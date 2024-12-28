import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/chat_user.dart';

class APIs {
  //getter for user id
  static User get user => auth.currentUser!;


  static FirebaseAuth auth = FirebaseAuth.instance;
  //for accessing cloud firestore database
  static FirebaseFirestore  firestore = FirebaseFirestore.instance;
  //for checking if user exist
  static Future<bool> userExists()async{
    return (
        await firestore.collection('users').doc(auth.currentUser!.uid).get()
    ).exists;
  }
  static Future<void> createUser()async{
  final time = DateTime.now().millisecond.toString();

    final chatuser = ChatUser(id:auth.currentUser!.uid,
        name:auth.currentUser!.displayName.toString(),
        email:auth.currentUser!.email.toString(),
        about:"HII",
        image:user.photoURL.toString(),
        createdAt:time,
        isOnline:false,
        lastActive:time,
        pushToken:''

    );
    return await firestore.collection('users').doc(user.uid).set(chatuser.toJson());
  }
}