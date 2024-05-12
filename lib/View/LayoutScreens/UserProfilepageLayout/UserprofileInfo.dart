
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Model/snapshot_handler.dart';
import '../../coreRes/color_handler.dart';
import '../../coreRes/icon_handler.dart';
import '../../subscreen/myProfile/update_profile_screen.dart';

class UserprofileInfo extends StatefulWidget {
  const UserprofileInfo({super.key});

  @override
  State<UserprofileInfo> createState() => _UserprofileInfoState();
}

class _UserprofileInfoState extends State<UserprofileInfo> {
  String path="";
  String fullName="Name";
  String email="@email.com";

  String defaultImg="https://cdn.vectorstock.com/i/1000x1000/13/68/person-gray-photo-placeholder-man-vector-23511368.webp";

  final User? user=SnapShotHandler.CurrentUser();
  CollectionReference User_profile = FirebaseFirestore.instance.collection("User_Profiles");


  ImageHandler() async {

    await User_profile.doc(user?.uid).get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          path = data['image'].toString();
          fullName = data['name'].toString();
          email = data['email'].toString();
        });
      },
      onError: (e) => print("Error getting document: $e"),
    ).onError((error, stackTrace) => null);

  }


  @override
  void initState(){
    try{
      ImageHandler();
    }catch(e) {

    }

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(children: [

          SizedBox(
            width: 90.r,
            height: 90.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.sp),
              child: Image.network(
                  path==""?defaultImg:path
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 18.r,
              height: 18.r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  color: Colors.yellow),
              child: Icon(
                IconHandler.alternate_pencil,
                color: ColorHandler.bgColor,
                size: 17.r,
              ),
            ),
          ),
        ]),

        SizedBox(
          height: 6.r,
        ),
        Text(
          fullName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorHandler.normalFont,
              fontSize: 18.sp,
              fontStyle: FontStyle.normal),
        ),
        Text(
          email,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: ColorHandler.normalFont,
              fontSize: 18.sp,
              fontStyle: FontStyle.normal),
        ),

        SizedBox(
          height: 16.r,
        ),

        SizedBox(
          width: 160.r,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent.withAlpha(100),
                minimumSize: Size(40.sp, 40.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateProfileScreen(),
                  ),
                );
              },
              child: Text(
                "Edit Profile",
                style: TextStyle(
                    color: ColorHandler.normalFont, fontSize: 18.sp),
              )),
        ),
      ],
    );
  }
}
