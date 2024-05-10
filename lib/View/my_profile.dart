
import 'dart:io';
import 'package:Monitor/View/LayoutScreens/UserProfilepageLayout/UserInfoNav.dart';
import 'package:Monitor/View/subscreen/authenticat/login.dart';
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
import 'LayoutScreens/UserProfilepageLayout/UserprofileInfo.dart';
import 'coreRes/color_handler.dart';
import 'coreRes/icon_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});




  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {





  @override
  void initState(){


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHandler.bgColor,
      ),
      backgroundColor: ColorHandler.bgColor,

      //body part
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8.sp),
        child: Column(
          children: [

            LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  return const UserprofileInfo();
                }),

            SizedBox(
              height: 10.r,
            ),
            Divider(),
            SizedBox(
              height: 10.r,
            ),

            //Menu
            LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  return const UserInfoNav();
                }),

          ],
        ),
      ),
    );
  }
}
