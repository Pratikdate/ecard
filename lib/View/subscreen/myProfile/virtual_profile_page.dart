import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Model/snapshot_handler.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../../Resource/icon_handler.dart';
import '../../QRScreens/image_picker.dart';


class VirtualProfileScreen extends StatefulWidget {
  const VirtualProfileScreen({super.key});
  static var croppedPath;


  @override
  State<VirtualProfileScreen> createState() => _VirtualProfileScreenState();
}

class _VirtualProfileScreenState extends State<VirtualProfileScreen> {

  bool EditPress= false;
  final controller1=TextEditingController();
  final controller2=TextEditingController();
  final controller3=TextEditingController();
  final controller4=TextEditingController();
  final controller5=TextEditingController();
  final controller6=TextEditingController();

  String title="John Grandson";
  String subtitle="Real Estate Broker";
  String about="This package is also a submission to Flutter Create contest. The basic rule of this contest is to measure the total Dart file size less or equal 5KB.After unzipping the compressed file, run following command to update dependencies";
  String twitter='';
  String linkedin='';
  String website='';
  String CorporateLogo='https://images.unsplash.com/photo-1620288627223-53302f4e8c74?q=80&w=464&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String Userimg="https://cdn.vectorstock.com/i/1000x1000/13/68/person-gray-photo-placeholder-man-vector-23511368.webp";
  File? image;
  final User? user=SnapShotHandler.CurrentUser();
  CollectionReference User_profile = FirebaseFirestore.instance.collection("User_Profiles");
  CollectionReference Virtual_Profile = FirebaseFirestore.instance.collection("Virtual_Profile");




  Future<void> SaveInfo() async {
    try {

      var imageName = user!.uid.toString();
      var storageRef = FirebaseStorage.instance.ref().child('VirtualProfileCompanyLogos/$imageName.jpg');
      image=File(VirtualProfileScreen.croppedPath);
      var uploadTask = storageRef.putFile(image!);
      await uploadTask;
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();



      var data={
        "CorporateLogo":downloadUrl.toString(),
        "title":title,
        "subtitle": subtitle,
        "about": about,
        "twitter":twitter,
        "Website": website,
        "Linkedin": linkedin
      };

      SnapShotHandler.SetData(Virtual_Profile.doc(user?.uid),data);


    } catch (e) {
      print("Error getting document: $e");
    }
  }


  Future<void> ImageHandler() async {
    if(VirtualProfileScreen.croppedPath!=null){
      image=File(VirtualProfileScreen.croppedPath);
    }

    await User_profile.doc(user?.uid).get().then(
          (DocumentSnapshot doc) {
            if(doc.exists) {
              final data = doc.data() as Map<String, dynamic>;
              setState(() {
                Userimg = data['image'].toString();
              });
            }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    await Virtual_Profile.doc(user?.uid).get().then(
          (DocumentSnapshot doc) {
            if (doc.exists) {
              final data = doc.data() as Map<String, dynamic>;
              setState(() {
                CorporateLogo = data['CorporateLogo'].toString();
                title=data['title'].toString();
                subtitle=data['subtitle'].toString();
                about=data['about'].toString();
                twitter=data['twitter'].toString();
                linkedin=data['Linkedin'].toString();
                website=data['website'].toString();
              });
            }

          },
      onError: (e) => print("Error getting document: $e"),
    );
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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorHandler.bgColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(children: [
                  SizedBox(
                    height: 260.r,
                    width: 440.r,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: SizedBox(
                        height: 220.r,
                        width: 220.r,
                        child: image!=null? Image.file(image!):Image.network(
                          CorporateLogo,

                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 26.r,
                      height: 26.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.yellow),
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 0),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ImagePicker_(isVirtualProfile: true,)));


                        },
                        icon: Icon(
                          IconHandler.alternate_pencil,
                          color: ColorHandler.bgColor,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 30.r,
                ),
                Stack(children: [
                  SizedBox(
                      height: 300.r,
                      width: 440.r,
                      child: Card(
                        margin: EdgeInsets.only(top: 10.sp),
                        elevation: 6.0,
                        color: Colors.amber,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        child: EditPress?

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,



                          children: [
                             SizedBox(
                               height: 30.r,
                               child: TextField(
                                 controller: controller1,
                                 textAlign: TextAlign.center,
                                 textAlignVertical: TextAlignVertical.bottom,

                                 selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
                                 decoration: InputDecoration(
                                   hintText: "ex. John Grandson",
                                     border: InputBorder.none



                                 ),
                               ),
                             ),
                            SizedBox(
                              height: 40.r,
                              child: TextField(

                                controller: controller2,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                  hintText: "ex. Real Estate Broker",
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 120.r,
                              child: TextField(

                                controller: controller3,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,

                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: "ex. This package is also a submission to Flutter Create contest. ",
                                    border: InputBorder.none



                                ),
                              ),
                            ),

                          ],
                        )

                            :Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FontHandler(
                              title,
                              color: ColorHandler.bgColor,
                              textAlign: TextAlign.center,
                              fontsize: 30.r,
                              fontweight: FontWeight.bold,
                            ),
                            FontHandler(subtitle,
                                color: ColorHandler.bgColor,
                                textAlign: TextAlign.center,
                                fontsize: 20.r,
                                fontweight: FontWeight.bold),
                            SizedBox(
                              height: 160.r,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Text(
                                  about,
                                  maxLines: 6,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 16.0.r,
                                      color: ColorHandler.bgColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 26.r,
                      height: 26.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.yellow),
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 0),
                        onPressed: () {
                          setState(() {

                            controller1.text==""?title=title:title=controller1.text;
                            controller2.text==""?subtitle=subtitle:subtitle=controller2.text;
                            controller3.text==""?about=about:about=controller3.text;
                            controller4.text==""?twitter=twitter:twitter=controller4.text;
                            controller5.text==""?linkedin=linkedin:linkedin=controller5.text;
                            controller6.text==""?website=website:website=controller6.text;


                            EditPress?(EditPress=false,SaveInfo()):EditPress=true;

                          });



                        },
                        icon: Icon(
                          EditPress? IconHandler.submit:IconHandler.alternate_pencil,
                          color: ColorHandler.bgColor,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ]),
                
                Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    SeeMore(
                        icon: IconHandler.twitter,
                        text: "Twitter",
                        onPressed: () {},
                      EditPress: EditPress, controller: controller4,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SeeMore(
                      icon: IconHandler.linkedin,
                      text: "Linkedin",
                      onPressed: () {},
                      EditPress: EditPress, controller: controller5,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SeeMore(
                        icon: IconHandler.earth, text: "Website", onPressed: () {},EditPress: EditPress, controller: controller6,),

                  ],
                ),

              ],
            ),
            Positioned(
              bottom: 460.r,
              left: 80.r,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0.330.r),
                alignment: AlignmentDirectional.center,
                child: Stack(children: [
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    width: 140.r,
                    height: 140.r,
                    decoration: BoxDecoration(
                      color: ColorHandler.normalFont,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        Userimg
                      ),
                    ),
                  ),

                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeeMore extends StatelessWidget {
  const SeeMore({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed, 
    required this.EditPress, 
    required this.controller,
  });
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final bool EditPress;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 54.r,
        width: 400.r,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
          color: ColorHandler.normalFont.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.sp,
              color: Colors.yellow,
            ),
            EditPress?
            SizedBox(
              height: 50.r,
              width: 240.r,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,

                selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
                decoration: InputDecoration(
                    hintText: text,


                ),
              ),

            )
                :Center(
                widthFactor: 2.sp,
                child: FontHandler(
                  text,
                  color: ColorHandler.normalFont,
                  textAlign: TextAlign.center,
                  fontweight: FontWeight.w800,
                  fontsize: 20.sp,
                )),
          ],
        ),
      ),
    );
  }
}
