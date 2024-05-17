import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/snapshot_handler.dart';
import '../subscreen/Comunity/ActivitesBar.dart';


class SearchController extends GetxController {
  RxList searchTerms = <Map<String, dynamic>>[].obs;

  // Add the getter for searchTerms
  List get getSearchTerms => searchTerms.toList();


  Future<void> loadData(String query) async {
    searchTerms.clear();

    await FirebaseFirestore.instance.collection("User_Profiles").get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (data['name'].toString().toLowerCase().contains(query.toLowerCase())) {
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



class CustomSearchDelegate extends SearchDelegate {
  final searchController = Get.put(SearchController());

  @override
  Widget buildResults(BuildContext context) {
    return Obx(() {
      if (searchController.getSearchTerms.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: searchController.searchTerms.length,
          itemBuilder: (context, index) {
            var result = searchController.searchTerms[index];
            return ListTile(
              title: ActivitesBar(
                FriendName: result['name'],
                isforSearch: true,
                ImgSrc: result['image'],
                Uid: result['uid'],
                onAddpress: () => searchController.addToConnections(result),
                FriendLavel: '',
              ),
            );
          },
        );
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Implement suggestions if needed
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

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

  @override
  void showResults(BuildContext context) {
    searchController.loadData(query);
    super.showResults(context);
  }

  @override
  void showSuggestions(BuildContext context) {
    // Implement suggestions if needed
  }
}