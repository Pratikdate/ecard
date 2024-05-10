import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../coreRes/color_handler.dart';
import '../../coreRes/font-handler.dart';

class UserProgressBarLayout extends StatefulWidget {
  const UserProgressBarLayout({super.key});

  @override
  State<UserProgressBarLayout> createState() => _UserProgressBarLayoutState();
}

class _UserProgressBarLayoutState extends State<UserProgressBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Top user name
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: FontHandler(
              "Pratik Date",
              color: ColorHandler.normalFont,
              textAlign: TextAlign.left,
              fontsize: 22.sp,
              fontweight: FontWeight.bold,
            ),
          ),
        ],
      ),

      SizedBox(height: 3.w), // Spacer

      // Progress bar
      Container(
        height: 76.r,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Card(
          color: ColorHandler.normalFont.withOpacity(0.1),
          child: Row(
            children: [
              // User profile image
              Padding(
                padding: EdgeInsets.all(6.sp),
                child: SizedBox(
                  width: 45.w,
                  height: 45.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
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
                      fontsize: 16.h,
                    ),
                    // Progress bar
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: SizedBox(
                        width: 226.w,
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
    ]);
  }
}
