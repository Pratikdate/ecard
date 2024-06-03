import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/Analysis/TodayReportController.dart';
import '../Resource/color_handler.dart';
import '../Resource/font-handler.dart';
import 'LayoutScreens/AnalyticspageLayout/TodaysReportLayout.dart';
import 'LayoutScreens/AnalyticspageLayout/UserStats.dart';
import 'LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';
import 'chart_screens/CircularProgress.dart';
import 'chart_screens/activty_chart.dart';



class AnalysisScreen extends StatelessWidget {
   AnalysisScreen({Key? key}) : super(key: key);

  final TodayReportController controller = TodayReportController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 24.r,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: ColorHandler.bgColor,
      ),
      backgroundColor: ColorHandler.bgColor,
      body: Stack(
        children:[

          SizedBox(
            height: Get.height-40,
            child: SingleChildScrollView(
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
                      SizedBox(height: 12.r),
                      ActivityChart(isanalysis: true, engagementRate: 10,),
                    ],
                  ),
                ),

              ],

                      ),
            ),
          ),
      Positioned(
        bottom: 0,
        child: Obx(
              ()=>Container(

          height: controller.height.value,
          decoration:  ShapeDecoration(
            //color: ColorHandler.bgColor,
            //
            shadows: [
              BoxShadow(
              color: ColorHandler.normalFont.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          BoxShadow(
            color:  ColorHandler.bgColor.withOpacity(0.8),
            // spreadRadius: 5,
            // blurRadius: 7,
            //offset: Offset(0, 3), // changes position of shadow
          ),],

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
               top: Radius.circular(30),
              ),
            ),
          ) ,

            width: 1.sw,
            child : Wrap(

                children: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHandler.normalFont,
                          minimumSize: Size(4.sp, 4.sp),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                      onPressed: (){
                          if(controller.height.value<=125.r){
                            controller.height.value=235.r;
                          }
                          else{
                            controller.height.value=125.r;
                          }
                        },

                        child: const SizedBox(
                          height: 2,
                          width: 28,
                        )
                    ),
                  ),

                   const TodaysReportLayout(),
            ]
          )
        ),
        )
      )
      ]
      ),
    );
  }
}

