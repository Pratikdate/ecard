
import 'package:Monitor/View/subscreen/Homesubscreen/UserProgressScreen.dart';
import 'package:Monitor/View/subscreen/myProfile/profiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Resource/color_handler.dart';
import '../../Resource/font-handler.dart';
import '../chart_screens/activty_chart.dart';
import 'activity_bar.dart';

class ProgressMenu extends StatelessWidget {


  const ProgressMenu({super.key,this.progress, this.progressname, this.progressicon,this.progressiconcolor, this.aboutprogress, });
  final progressname;
  final progressicon;
  final progressiconcolor;
  final progress;
  final aboutprogress;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      height: 140.r,
      width: 120.r,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserProgressScreen()));
        },
        child: Stack(
          children:[
            SizedBox(
              width: 120.r,
              height: 120.r,
              child: Card(
                color:ColorHandler.normalFont.withOpacity(0.1),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FontHandler(progress,color: ColorHandler.normalFont, textAlign:TextAlign.center,fontweight: FontWeight.bold,fontsize: 20,),
                    FontHandler(aboutprogress,color: ColorHandler.normalFont.withOpacity(0.6), textAlign:TextAlign.center,fontsize: 12,),
                  ],
                ),

              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 26.r,
                height: 26.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    color: progressiconcolor),
                child:  Icon(
                  progressicon,
                  color: ColorHandler.normalFont.withOpacity(1),
                  size: 18.sp,
                ),
              ),
            ),


            Positioned(
              top: 10.r,
              left: 20.r,
              child: FontHandler(progressname, color: ColorHandler.normalFont, textAlign: TextAlign.center,fontsize: 16,fontweight: FontWeight.bold,),
            ),
            Center(
              widthFactor: 50.r,
              heightFactor: 50.r,
              child: Padding(
                padding: EdgeInsets.all(4.0.r),
                child: ActivityChart(engagementRate: 0,),
              ),
            ),

          ]
        ),
      ),
    );
  }
}
