import 'package:ecard/core/res/font-handler.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VirtualProfileScreen extends StatelessWidget {
  const VirtualProfileScreen({super.key});
  static const routeName = '/Update_profile';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
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
                        )),
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
                      child: const Icon(
                        IconHandler.alternate_pencil,
                        color: Colors.black,
                        size: 20,
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
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FontHandler("John Grandson", color: Colors.black,textAlign: TextAlign.center,fontsize: 40.sp,fontweight: FontWeight.bold,),
                            FontHandler("Real Estate Broker", color: Colors.black,textAlign: TextAlign.center,fontsize: 25.sp,fontweight: FontWeight.bold),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w ,vertical: 10.h),
                              child: Text("This package is also a submission to Flutter Create contest. The basic rule of this contest is to measure the total Dart file size less or equal 5KB.After unzipping the compressed file, run following command to update dependencies",maxLines: 6,softWrap: true,style:TextStyle(fontSize: 16.0, color: Colors.black) ,),
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
                      child: const Icon(
                        IconHandler.alternate_pencil,
                        color: Colors.black,
                        size: 20,
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
                    icon: IconHandler.earth,
                    text: "Website",
                    onPressed: () {}),
                SizedBox(
                  height: 16.h,
                ),
                SeeMore(
                    icon: IconHandler.linkedin,
                    text: "Linkedin",
                    onPressed: () {})
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage("assets_/img1.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 14.sp,
                  right: 14.sp,
                  child: Container(
                    width: 26.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: Colors.yellow),
                    child: const Icon(
                      IconHandler.camera,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
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
          color: Colors.white.withOpacity(0.3),
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
                  color: Colors.white,
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
