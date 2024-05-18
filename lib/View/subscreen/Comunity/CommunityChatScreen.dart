import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Controller/ChatScreen/ActivitesBarController.dart';
import '../../../Controller/ChatScreen/CommunityChatController.dart';
import 'ActivitesBar.dart';



class CommunityChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final CommunityChatController controller = Get.put(CommunityChatController());

    return StreamBuilder<QuerySnapshot>(
      stream: controller.getUserConnectionsSnapshot(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<Map<String, dynamic>> storedocs = [];
        try {
          snapshot.data!.docs.forEach((DocumentSnapshot document) {
            Map<String, dynamic> a = document.data() as Map<String, dynamic>;

            if (a["uid"] != controller.auth.currentUser?.uid) {
              storedocs.add(a);
              a['id'] = document.id;
            }
          });
        }catch(e){}

        return storedocs.isEmpty?
            const SizedBox()
            :SizedBox(
          height: height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (var item = 0; item < storedocs.length; item++) ...{
                  ActivitesBar(
                    FriendName: storedocs[item]['name'],
                    ImgSrc: storedocs[item]['image'],
                    Uid: storedocs[item]['uid'],
                    lastseen: '10:2',
                    lastmessage: 'hii whats up',
                    FriendLavel: '',
                  )
                }
              ],
            ),
          ),
        );
      },
    );
  }
}

