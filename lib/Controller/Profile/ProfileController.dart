import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var userProfile = Rxn<DocumentSnapshot>();


  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    var uid = auth.currentUser?.uid;
    if (uid != null) {
      userProfile.value = await firestore.collection('users').doc(uid).get();
    }
  }
}
