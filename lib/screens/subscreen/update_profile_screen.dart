import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecard/core/models/image_picker.dart';
import 'package:ecard/core/res/color_handler.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userphone = TextEditingController();
  final userabout = TextEditingController();

  var name;
  var email;
  var phone;
  var about;

  CollectionReference User_profile =
      FirebaseFirestore.instance.collection("User_Profiles");
  Future<void> setProfile() async {
    try {
      await User_profile.doc(phone)
          .set({
            "name": name,
            "email": email,
            "phone": phone,
            "about": about,
          })
          .then((value) => print("user delete"))
          .catchError(() => print("Fail delete user"));
    } catch (e) {
      print(name);
      print(email);
    }
  }

  //Image Picker Code gallery

  final picker = ImagePicker();
  String path = "";
  File? _image;
  dynamic? pickedFile;

  Future getImageFromGallery() async {
    pickedFile = await picker.pickImage(
        source: ImageSource.gallery, requestFullMetadata: false, maxWidth: 120);

    setState(() {
      if (pickedFile != null) {
        try {
          _image = File(pickedFile.path);
          path = _image!.path;
        } catch (e) {}
      }
    });
  }

  //croper

  CroppedFile? _croppedFile;
  Future<void> _cropImage() async {

    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
          print(_croppedFile);
        });
      }
    }
  }

  void _clearImage() {
    setState(() {
      _croppedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHandler.bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorHandler.bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconHandler.angle_left,
            color: ColorHandler.normalFont,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: ColorHandler.normalFont,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 38.sp),
          child: Column(children: [
            Stack(children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.sp),
                  child: Image(
                    image: AssetImage(path == "" ? "assets_/img1.jpg" : path),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    width: 24.sp,
                    height: 24.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: Colors.yellow),
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 0),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePicker_()));
                      },
                      icon: Icon(
                        IconHandler.camera,
                        color: ColorHandler.bgColor,
                        size: 20.sp,
                      ),
                    )),
              ),
            ]),
            SizedBox(
              height: 25.sp,
            ),
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: ColorHandler.normalFont,
                      label: Text("Full Name"),
                      prefixIcon: Icon(
                        IconHandler.person,
                      ),
                    ),
                    controller: userName,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("E-Mail"),
                      prefixIcon: Icon(
                        IconHandler.mail,
                      ),
                    ),
                    controller: userEmail,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Phone"),
                      prefixIcon: Icon(
                        IconHandler.phone,
                      ),
                    ),
                    controller: userphone,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("About"),
                      prefixIcon: Icon(
                        IconHandler.pass,
                      ),
                    ),
                    controller: userabout,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  SizedBox(
                    width: 200.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.deepPurpleAccent.withAlpha(100),
                          minimumSize: Size(40.sp, 40.sp),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                        onPressed: () {
                          //if(_formkey.currentState!.validate()){

                          try {
                            setState(() {
                              name = userName.text;
                              email = userEmail.text;
                              phone = userphone.text;
                              about = userabout.text;
                            });
                            setProfile();
                            Navigator.pop(context);
                          } catch (e) {}
                        },
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: ColorHandler.normalFont, fontSize: 20.sp),
                        )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
