import 'dart:io';
import 'dart:ui';

import 'package:ecard/core/res/color_handler.dart';
import 'package:ecard/core/res/font-handler.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/models/image_picker.dart';

class VirtualProfileScreen extends StatefulWidget {
  const VirtualProfileScreen({super.key});

  @override
  State<VirtualProfileScreen> createState() => _VirtualProfileScreenState();
}

class _VirtualProfileScreenState extends State<VirtualProfileScreen> {

  bool EditPress= false;
  final controller1=TextEditingController();
  final controller2=TextEditingController();
  final controller3=TextEditingController();

  String title="John Grandson";
  String subtitle="Real Estate Broker";
  String about="This package is also a submission to Flutter Create contest. The basic rule of this contest is to measure the total Dart file size less or equal 5KB.After unzipping the compressed file, run following command to update dependencies";

  SaveInfo(){

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorHandler.bgColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(children: [
                  SizedBox(
                    height: 280.h,
                    width: 460.w,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(
                          "assets_/img2.jpg",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 26.w,
                      height: 26.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.yellow),
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 0),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ImagePicker_()));


                        },
                        icon: Icon(
                          IconHandler.alternate_pencil,
                          color: ColorHandler.bgColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 20.h,
                ),
                Stack(children: [
                  SizedBox(
                      height: 300.h,
                      width: 460.w,
                      child: Card(
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
                               height: 30,
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
                              height: 40,
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
                              height: 120,
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
                              fontsize: 40.sp,
                              fontweight: FontWeight.bold,
                            ),
                            FontHandler(subtitle,
                                color: ColorHandler.bgColor,
                                textAlign: TextAlign.center,
                                fontsize: 25.sp,
                                fontweight: FontWeight.bold),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: Text(
                                about,
                                maxLines: 6,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: ColorHandler.bgColor),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 26.w,
                      height: 26.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.yellow),
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 0),
                        onPressed: () {
                          setState(() {

                            controller1.text==""?title=title:title=controller1.text;
                            controller1.text==""?subtitle=subtitle:subtitle=controller1.text;
                            controller1.text==""?about=about:about=controller1.text;
                            SaveInfo();
                            EditPress?EditPress=false:EditPress=true;

                          });


                        },
                        icon: Icon(
                          EditPress? IconHandler.submit:IconHandler.alternate_pencil,
                          color: ColorHandler.bgColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 16.h,
                ),
                SeeMore(
                    icon: IconHandler.whatsapp,
                    text: "Whatsapp",
                    onPressed: () {}),
                SizedBox(
                  height: 16.h,
                ),
                SeeMore(
                    icon: IconHandler.earth, text: "Website", onPressed: () {}),
                SizedBox(
                  height: 16.h,
                ),
                SeeMore(
                    icon: IconHandler.linkedin,
                    text: "Linkedin",
                    onPressed: () {}
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height.sp / 2.sp - 210.sp),
              alignment: AlignmentDirectional.center,
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.all(8.sp),
                  width: 180.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: ColorHandler.normalFont,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage("assets_/img1.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 14.sp,
                  right: 14.sp,
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
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ImagePicker_()));


                        },
                        icon: Icon(
                          IconHandler.camera,
                          color: ColorHandler.bgColor,
                          size: 20.sp,
                        ),
                      )),
                ),
              ]),
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
  });
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        width: 400.w,
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
            Center(
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
