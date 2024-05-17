import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Resource/color_handler.dart';
import '../Resource/font-handler.dart';
import 'LayoutScreens/AnalyticspageLayout/TodaysReportLayout.dart';
import 'LayoutScreens/AnalyticspageLayout/UserStats.dart';
import 'LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';
import 'chart_screens/CircularProgress.dart';
import 'chart_screens/activty_chart.dart';



class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.r,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: ColorHandler.bgColor,
      ),
      backgroundColor: ColorHandler.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserStats(),
            SizedBox(height: 8.r),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 345.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.sp),
                    child: FontHandler(
                      "Engagement Rate",
                      color: ColorHandler.normalFont,
                      textAlign: TextAlign.start,
                      fontsize: 22.sp,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14.r),
                  ActivityChart(isanalysis: true, engagementRate: 10,),
                ],
              ),
            ),
            SizedBox(height: 14.r),
            const TodaysReportLayout(),
          ],
        ),
      ),
    );
  }
}

