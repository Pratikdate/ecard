import 'package:Monitor/View/subscreen/Comunity/community.dart';
import 'package:Monitor/View/widges/CustomSearchDelegate.dart';
import 'package:Monitor/View/widges/progressMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'coreRes/color_handler.dart';
import 'coreRes/font-handler.dart';
import 'coreRes/icon_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}); // Constructor for HomeScreen widget

  static const routeName = "/home"; // Route name for navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Customized app bar
        toolbarHeight: 60,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: ColorHandler.bgColor,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Navigation icons
            IconButton(
              onPressed: () {
                // Navigate to home screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(
                IconHandler.notification,
                color: CupertinoColors.systemGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  // Show search bar
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  IconHandler.search,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
          ],
        ),
      ),

      backgroundColor: ColorHandler.bgColor,

      // Body content
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top user name
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const FontHandler(
                    "Pratik Date",
                    color: ColorHandler.normalFont,
                    textAlign: TextAlign.left,
                    fontsize: 26,
                    fontweight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.w), // Spacer

            // Progress bar
            Container(
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Card(
                color: ColorHandler.normalFont.withOpacity(0.1),
                child: Row(
                  children: [
                    // User profile image
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.sp),
                          child: const Image(
                            image: AssetImage("assets/img1.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    // Progress information
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Progress level
                          FontHandler(
                            "Level 16",
                            color: Colors.greenAccent,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.normal,
                            fontsize: 20.h,
                          ),
                          // Progress bar
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: SizedBox(
                              width: 240.w,
                              child: FAProgressBar(
                                currentValue: 80.sp,
                                size: 8.sp,
                                backgroundColor: ColorHandler.normalFont,
                                progressGradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.purple.shade300,
                                    Colors.deepPurpleAccent.withAlpha(100)
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
            ),

            SizedBox(height: 20.h), // Spacer

            // Monitoring progress on different platforms
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress section title
                  FontHandler(
                    "Progress",
                    color: ColorHandler.normalFont,
                    textAlign: TextAlign.start,
                    fontsize: 22.sp,
                    fontweight: FontWeight.normal,
                  ),
                  // Progress menu items
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Progress menu items
                        ProgressMenu(
                          progress: "good",
                          progressicon: IconHandler.artical,
                          progressiconcolor: ColorHandler.blue,
                          progressname: "Post",
                          aboutprogress: "Overall Quality",
                        ),
                        ProgressMenu(
                          progress: "260",
                          progressicon: IconHandler.view,
                          progressiconcolor: ColorHandler.violate,
                          progressname: "Views",
                          aboutprogress: "Maximum Views",
                        ),
                        ProgressMenu(
                          progress: "27",
                          progressicon: IconHandler.like,
                          progressiconcolor: ColorHandler.yellow,
                          progressname: "Likes",
                          aboutprogress: "Maximum Likes",
                        ),
                        ProgressMenu(
                          progress: "8",
                          progressicon: IconHandler.comment,
                          progressiconcolor: ColorHandler.pink,
                          progressname: "Comments",
                          aboutprogress: "Maximum Comments",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Friends activity section
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Friends activity section title
                  FontHandler(
                    "Friends Activity",
                    color: ColorHandler.normalFont,
                    textAlign: TextAlign.start,
                    fontsize: 22.sp,
                    fontweight: FontWeight.normal,
                  ),
                  // Friends activity list
                  FadedEdges(
                    child: SizedBox(
                      height: 340.h,
                      child:  SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            // Individual friend activity bars
                            ActivitesBar(
                              FriendName: "Gaspard",
                              FriendLavel: "Lv2",
                              ImgSrc: 'assets/img1.jpg', Uid: '',
                            ),
                            ActivitesBar(
                              FriendName: "Rapier",
                              FriendLavel: "Lv3",
                              ImgSrc: 'assets/img1.jpg', Uid: '',
                            ),
                            ActivitesBar(
                                FriendName: "Bhavika",
                                FriendLavel: "Lv4",
                                ImgSrc: 'assets/img3.jpg', Uid: '',
                            ),
                            ActivitesBar(
                              FriendName: "Dev",
                              FriendLavel: "Lv3",
                              ImgSrc: 'assets/img4.jpg', Uid: '',
                            ),
                            ActivitesBar(
                              FriendName: "Arjun",
                              FriendLavel: "Lv1",
                              ImgSrc: 'assets/img5.jpg', Uid: '',
                            ),
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
      {super.key,
      required this.child,
      this.colors,
      this.stops,
      this.isHorizontal = false});
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
                      ColorHandler.normalFont.withOpacity(0.60),
                      Colors.transparent,
                      Colors.transparent,
                      ColorHandler.normalFont.withOpacity(0.60)
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
    Rect rect =
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = const LinearGradient(
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
