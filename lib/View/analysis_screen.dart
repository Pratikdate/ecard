
import 'package:Monitor/View/LayoutScreens/AnalyticspageLayout/TodaysReportLayout.dart';
import 'package:Monitor/View/LayoutScreens/AnalyticspageLayout/UserStats.dart';
import 'package:Monitor/View/widges/report_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';
import 'chart_screens/CircularProgress.dart';
import 'chart_screens/activty_chart.dart';
import 'coreRes/color_handler.dart';
import 'coreRes/font-handler.dart';
import 'coreRes/icon_handler.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({
    super.key,
  });

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:  AppBar(
          toolbarHeight: 50.r,
          leadingWidth: MediaQuery.of(context).size.width,
          backgroundColor: ColorHandler.bgColor,
        ),

        backgroundColor: ColorHandler.bgColor,
        body: SingleChildScrollView(

          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Top name of User
                LayoutBuilder(
                    builder: (BuildContext ctx, BoxConstraints constraints) {
                      return UserStats();
                    }),


            SizedBox(
              height: 8.r,
            ),

            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 345.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0.sp),
                      child: FontHandler(
                        "Engagement Rate",
                        color: ColorHandler.normalFont,
                        textAlign: TextAlign.start,
                        fontsize: 22.sp,
                        fontweight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 14.r,
                    ),
                    const ActivityChart(isanalysis: true),
                  ],
                )),
                SizedBox(
                  height: 14.r,
                ),


                LayoutBuilder(
                    builder: (BuildContext ctx, BoxConstraints constraints) {
                      return TodaysReportLayout();
                    }),


          ]),
        ));
  }
}
