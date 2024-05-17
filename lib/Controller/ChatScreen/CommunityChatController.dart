import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CommunityChatController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;


  Stream<QuerySnapshot> getUserConnectionsSnapshot() {
    // Implement your logic to get the user connections snapshot
    // For example:
    return FirebaseFirestore.instance
        .collection("User_Connections")
        .doc(_auth.currentUser!.uid)
        .collection("Connections")
        .snapshots();
  }
}