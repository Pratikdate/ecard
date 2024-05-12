import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../chart_screens/CircularProgress.dart';
import '../../coreRes/color_handler.dart';
import '../../coreRes/font-handler.dart';

class UserStats extends StatefulWidget {
  const UserStats({super.key
  });


  @override
  State<UserStats> createState() => _UserStatsState();
}

class _UserStatsState extends State<UserStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontHandler(
            "Pratik date`s Stats",
            color: ColorHandler.normalFont,
            textAlign: TextAlign.start,
            fontsize: 20.sp,
            fontweight: FontWeight.bold,
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
              Column(children: [
                FontHandler(
                  "Total Impressions :",
                  color: ColorHandler.violate,
                  textAlign: TextAlign.left,
                  fontweight: FontWeight.bold,
                  fontsize: 18.sp,
                ),
                FontHandler(
                  "Total Likes             :",
                  color: ColorHandler.violate,
                  textAlign: TextAlign.left,
                  fontweight: FontWeight.bold,
                  fontsize: 18.sp,
                ),
                FontHandler(
                  "Total Followers     :",
                  color: ColorHandler.violate,
                  textAlign: TextAlign.left,
                  fontweight: FontWeight.bold,
                  fontsize: 18.sp,
                ),
                FontHandler(
                  "Total Comments   :",
                  color: ColorHandler.violate,
                  textAlign: TextAlign.left,
                  fontweight: FontWeight.bold,
                  fontsize: 18.sp,
                ),
                FontHandler(
                  "Total Shares          :",
                  color: ColorHandler.violate,
                  textAlign: TextAlign.left,
                  fontweight: FontWeight.bold,
                  fontsize: 18.sp,
                ),


              ]
              ),
              Column(
                children: [
                  FontHandler("100",
                    color: ColorHandler.violate,
                    textAlign: TextAlign.left,
                    fontweight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),
                  FontHandler("100",
                    color: ColorHandler.violate,
                    textAlign: TextAlign.left,
                    fontweight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),FontHandler("100",
                    color: ColorHandler.violate,
                    textAlign: TextAlign.left,
                    fontweight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),FontHandler("100",
                    color: ColorHandler.violate,
                    textAlign: TextAlign.left,
                    fontweight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),FontHandler("100",
                    color: ColorHandler.violate,
                    textAlign: TextAlign.left,
                    fontweight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),
                ],
              ),
              SizedBox(
                width: 40.r,
              ),
              SizedBox(
                  width: 90.r, height: 90.r, child: CircularProgress()),
            ],
          ),
        ],
      ),
    );
  }
}
