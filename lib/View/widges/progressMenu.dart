
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../analysis_screen.dart';
import '../chart_screens/activty_chart.dart';
import '../coreRes/color_handler.dart';
import '../coreRes/font-handler.dart';
import 'activites_bar.dart';

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
      height: 160.w,
      width: 140.w,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AnalysisScreen(isanalysis: false,isprogress: true,)));
        },
        child: Stack(
          children:[
            SizedBox(
              width: 140.h,
              height: 140.h,
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
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    color: progressiconcolor),
                child:  Icon(
                  progressicon,
                  color: ColorHandler.normalFont.withOpacity(1),
                  size: 18,
                ),
              ),
            ),


            Positioned(
              top: 10,
              left: 20,
              child: FontHandler(progressname, color: ColorHandler.normalFont, textAlign: TextAlign.center,fontsize: 16,fontweight: FontWeight.bold,),
            ),
            Center(
              widthFactor: 50,
              heightFactor: 50,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ActivityChart(),
              ),
            ),

          ]
        ),
      ),
    );
  }
}
