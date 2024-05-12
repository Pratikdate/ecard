
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Model/snapshot_handler.dart';
import '../coreRes/color_handler.dart';
import '../subscreen/Comunity/CommunityChatScreen.dart';


class CustomSearchDelegate extends SearchDelegate {


  CustomSearchDelegate(){
    _LoadData(query);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;


  // Demo list to show querying
  List searchTerms = [

  ];


  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }
  Future<void> _LoadData (dynamic query)  async {

    await FirebaseFirestore.instance.collection("User_Profiles").get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map a = doc.data() as Map<String, dynamic>;
        searchTerms.add(a);

      });
    });


  }

  Future<void> AddToConnections(dynamic result) async {
    final data={
      "name":result['name'].toString(),
      "image": result['image'].toString(),
      "uid": result['uid'].toString(),
    };


    await SnapShotHandler.SetData(
        FirebaseFirestore.instance.collection('User_Connections')
        .doc(auth.currentUser?.uid).collection("Connections").doc(result['uid']),data);

    
  }




  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];



    for (var re in searchTerms) {
      if (re["name"]==query) {

        matchQuery.add(re);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          
          title:  ActivitesBar(
            FriendName: result['name'],
            isforSearch:true,
            ImgSrc: result['image'],
            Uid: result['uid'],
            onAddpress:(){ AddToConnections(result);}, FriendLavel: '',

          ),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.contains(query)) {
    //     matchQuery.add(fruit);
    //   }
    // }
    return ColoredBox(
      color: ColorHandler.bgColor,
      child: ListView.builder(

        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(

            title: Text(result),
          );
        },
      ),
    );
  }
}