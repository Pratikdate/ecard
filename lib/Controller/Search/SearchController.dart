import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Model/snapshot_handler.dart';

class SearchController extends GetxController {
  RxList searchTerms = <Map<String, dynamic>>[].obs;

  // Add the getter for searchTerms
  List get getSearchTerms => searchTerms.toList();


  Future<void> loadData(String query) async {
    searchTerms.clear();

    await FirebaseFirestore.instance.collection("User_Profiles").get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (data['name'].toString().contains(query)) {
          searchTerms.add(data);
        }
      });
    });
  }

  Future<void> addToConnections(Map<String, dynamic> result) async {
    final data = {
      "name": result['name'].toString(),
      "image": result['image'].toString(),
      "uid": result['uid'].toString(),
    };

    await SnapShotHandler.SetData(
        FirebaseFirestore.instance.collection('User_Connections').doc(FirebaseAuth.instance.currentUser?.uid).collection("Connections").doc(result['uid']),
        data);
  }
}
