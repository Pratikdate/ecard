import 'package:ecard/core/res/font-handler.dart';
import 'package:ecard/screens/widges/activites_bar.dart';
import 'package:ecard/screens/widges/progressMenu.dart';
import 'package:ecard/screens/widges/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: Colors.black12,
        leading:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: SearchBarWidge(),
            ),
          ],
        ),
    ),




      backgroundColor: Colors.black,



      //body part
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //padding: EdgeInsets.all(20.0.sp),

          children: [
            //Top name of User
            Column(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: FontHandler(
                    "Pratik Date",
                    color: Colors.white,
                    textAlign: TextAlign.left,
                    fontsize: 26,
                    fontweight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 6.w,
            ),

            //Progress bar
            Container(
              
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Card(
                color:Colors.white.withOpacity(0.1),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.sp),
                          child: const Image(
                            image: AssetImage("assets_/img1.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 8,top: 8),
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontHandler(
                            "Level 16",
                            color: Colors.white,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.normal,
                            fontsize: 20.h,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: SizedBox(
                              width: 240.w,
                              child: FAProgressBar(
                                currentValue: 80.sp,
                                size: 8.sp,
                                backgroundColor: Colors.white,
                                progressGradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [Colors.purple.shade300,Colors.deepPurpleAccent.withAlpha(100)])),
                              ),
                            ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            //monitoring progrss on differant platform
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontHandler(
                    "Progress",
                    color: Colors.white,
                    textAlign: TextAlign.start,
                    fontsize: 22.sp,
                    fontweight: FontWeight.normal,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProgressMenu(),
                        ProgressMenu(),
                        ProgressMenu(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontHandler(
                    "Friends Activity",
                    color: Colors.white,
                    textAlign: TextAlign.start,
                    fontsize: 22.sp,
                    fontweight: FontWeight.normal,
                  ),
                  Container(
                    height: 340.h,
                    child: const FadedEdges(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ActivitesBar(
                                FriendName: "Gaspard", FriendLavel: "Lv2", ImgSrc: 'assets_/img1.jpg',),
                            ActivitesBar(
                                FriendName: "Rapier", FriendLavel: "Lv3", ImgSrc: 'assets_/img1.jpg',),
                            ActivitesBar(
                                FriendName: "Bhavika", FriendLavel: "Lv4", ImgSrc: 'assets_/img3.jpg',),
                            ActivitesBar(
                                FriendName: "Dev", FriendLavel: "Lv3", ImgSrc: 'assets_/img4.jpg',),
                            ActivitesBar(
                                FriendName: "Arjun", FriendLavel: "Lv1", ImgSrc: 'assets_/img5.jpg',),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FadedEdges extends StatelessWidget {
  const FadedEdges(
      {Key? key,
      required this.child,
      this.colors,
      this.stops,
      this.isHorizontal = false})
      : super(key: key);
  final Widget child;
  final List<Color>? colors;
  final List<double>? stops;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (Rect rect) => LinearGradient(
                colors: colors ??
                    [
                      Colors.white.withOpacity(0.60),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white.withOpacity(0.60)
                    ],
                stops: stops ?? const [0.1, 0.25, 0.85, 1.0],
                begin:
                    !isHorizontal ? Alignment.topCenter : Alignment.centerLeft,
                end: !isHorizontal
                    ? Alignment.bottomCenter
                    : Alignment.centerRight)
            .createShader(rect),
        child: child);
  }
}

class FadingEffect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          //create 2 white colors, one transparent
          Color.fromARGB(0, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255)
        ]);
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffect linePainter) => false;
}
