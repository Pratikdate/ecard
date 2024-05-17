import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../Model/snapshot_handler.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/icon_handler.dart';
import '../../QRScreens/image_picker.dart';
import '../../my_profile.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  static var croppedPath;

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

  String path =
      "https://cdn.vectorstock.com/i/1000x1000/13/68/person-gray-photo-placeholder-man-vector-23511368.webp";
  File? image;
  final User? user = SnapShotHandler.CurrentUser();

  clear() {
    userName.clear();
    userEmail.clear();
    userphone.clear();
    userabout.clear();
  }

  CollectionReference User_profile =
      FirebaseFirestore.instance.collection("User_Profiles");
  final _formKey = GlobalKey<FormState>();

  Future<void> setProfile() async {
    try {
      var imageName = user!.uid.toString();
      var storageRef = FirebaseStorage.instance
          .ref()
          .child('User_profile_images/$imageName.jpg');
      image = File(UpdateProfileScreen.croppedPath);
      var uploadTask = storageRef.putFile(image!);
      await uploadTask;
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();

      var data = {
        "uid": user?.uid,
        "image": downloadUrl.toString(),
        "name": name,
        "email": email,
        "phone": phone,
        "about": about,
      };

      SnapShotHandler.SetData(User_profile.doc(user?.uid), data);
    } catch (e) {
      print("Error getting document: $e");
    }
  }

  ImageHandler() async {
    if (UpdateProfileScreen.croppedPath != null) {
      setState(() {
        image = File(UpdateProfileScreen.croppedPath);
      });
    }

    await User_profile.doc(user?.uid).get().then(
      (DocumentSnapshot doc) {
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
    try {
      ImageHandler();
    } catch (e) {}
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
                (route) => false);
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
                  child: image != null
                      ? Image.file(image!)
                      : Image.network(
                          path,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImagePicker_(
                                      isUpdateProfile: true,
                                    )));
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
              key: _formKey,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter name';
                      }
                    },
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
                      validator: validateEmail),
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
                    validator: (value) {
                      if (value!.isEmpty || value.length != 10) {
                        return 'please enter valid Phone number';
                      }
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter about text';
                      }
                    },
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
                          if (_formKey.currentState!.validate()) {
                            try {
                              setState(() {
                                name = userName.text;
                                email = userEmail.text;
                                phone = userphone.text;
                                about = userabout.text;
                              });
                              setProfile();
                              clear();
                            } catch (e) {}
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                                (route) => false);
                          }
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
