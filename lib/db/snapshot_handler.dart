


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SnapShotHandler extends StatelessWidget{

  SnapShotHandler(){


  }

  static User? CurrentUser(){
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    return user;
  }



  static dynamic GetData(dynamic document,) async {
    final docRef = document;
    await docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );


  }

  static Future<void>  SetData(dynamic document,dynamic data) async {
    final docRef = document ;
    await docRef.set(data);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }




}