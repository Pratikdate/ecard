
import 'dart:io';
import 'package:Monitor/View/subscreen/myProfile/profiles.dart';
import 'package:Monitor/View/subscreen/myProfile/update_profile_screen.dart';
import 'package:Monitor/View/subscreen/myProfile/virtual_profile_page.dart';
import 'package:Monitor/View/widges/profileMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Model/snapshot_handler.dart';
import 'coreRes/color_handler.dart';
import 'coreRes/icon_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});




  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorHandler.bgColor,
      ),
      backgroundColor: ColorHandler.bgColor,

      //body part
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp),
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: 120,
                  height: 120,
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
                    width: 26.sp,
                    height: 26.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: Colors.yellow),
                    child: const Icon(
                      IconHandler.alternate_pencil,
                      color: ColorHandler.bgColor,
                      size: 20,
                    ),
                  ),
                ),
              ]),

              SizedBox(
                height: 10.sp,
              ),
              Text(
                fullName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorHandler.normalFont,
                    fontSize: 20.sp,
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
                height: 25.sp,
              ),

              SizedBox(
                width: 200.sp,
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
                          color: ColorHandler.normalFont, fontSize: 20.sp),
                    )),
              ),

              SizedBox(
                height: 30.sp,
              ),
              Divider(),
              SizedBox(
                height: 30.sp,
              ),

              //Menu
              ProfileMenuWidget(
                icon: IconHandler.home,
                title: "Page",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VirtualProfileScreen(),
                      ),);

                },

                endIcon: true,
                textColor: ColorHandler.normalFont,
              ),
              ProfileMenuWidget(
                icon: IconHandler.cog,
                title: "Setting",
                onPressed: () {},
                endIcon: true,
                textColor: ColorHandler.normalFont,
              ),
              ProfileMenuWidget(
                icon: IconHandler.credit_card,
                title: "Billing Details",
                onPressed: () {},
                endIcon: true,
                textColor: ColorHandler.normalFont,
              ),
              ProfileMenuWidget(
                icon: IconHandler.info_circle,
                title: "Information",
                onPressed: () {},
                endIcon: true,
                textColor: ColorHandler.normalFont,
              ),
              ProfileMenuWidget(
                icon: IconHandler.artical,
                title: "Profiles",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserProfilesScreen()));

                },
                endIcon: true,
                textColor: ColorHandler.normalFont,
              ),
              ProfileMenuWidget(
                icon: IconHandler.logout,
                title: "Logout",
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Phoenix.rebirth(context);
                },
                endIcon: false,
                textColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
