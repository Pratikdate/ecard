import 'package:ecard/core/res/color_handler.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:ecard/screens/chart_screens/CircularProgress.dart';
import 'package:ecard/screens/widges/activites_bar.dart';
import 'package:ecard/screens/widges/report_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../core/res/font-handler.dart';
import 'chart_screens/activty_chart.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key,this.isanalysis=true, this.isprogress=false, this.isactivity=false, });
  final bool isanalysis;
  final bool isprogress;
  final bool isactivity;

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {



  @override
  Widget build(BuildContext context) {







    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: MediaQuery.of(context).size.width,
    backgroundColor: ColorHandler.bgColor,
    ),
        backgroundColor: ColorHandler.bgColor,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [
              //Top name of User
            widget.isactivity?Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: FontHandler(
                      "Pratik Date",
                      color: ColorHandler.normalFont,
                      textAlign: TextAlign.left,
                      fontsize: 26,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                ],
              ):SizedBox() ,
                  widget.isactivity?SizedBox(
                height: 6.w,
              ):SizedBox() ,

              //Progress bar
              widget.isactivity?Container(
                height: 80.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Card(
                  color: ColorHandler.normalFont.withOpacity(0.1),
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
                        padding: EdgeInsets.only(left: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FontHandler(
                              "Level 16",
                              color: Colors.greenAccent,
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
                                    backgroundColor: ColorHandler.normalFont,
                                    progressGradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.purple.shade300,
                                          Colors.deepPurpleAccent.withAlpha(100)
                                        ])),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ):SizedBox() ,

                  SizedBox(
                    height: 20.h,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontHandler(
                          "Pratik date`s Stats",
                          color: ColorHandler.normalFont,
                          textAlign: TextAlign.start,
                          fontsize: 22.sp,
                          fontweight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Column(
                                children: [
                                  FontHandler("Total stars earned :   "+"029",color: ColorHandler.violate, textAlign:TextAlign.center,fontweight: FontWeight.bold,fontsize: 20,),
                                  FontHandler("Total stars earned :   "+"185",color: ColorHandler.violate, textAlign:TextAlign.center,fontweight: FontWeight.bold,fontsize: 20,),
                                  FontHandler("Total stars earned :   "+"015",color: ColorHandler.violate, textAlign:TextAlign.center,fontweight: FontWeight.bold,fontsize: 20,),
                                  FontHandler("Total stars earned :   "+"005",color: ColorHandler.violate, textAlign:TextAlign.center,fontweight: FontWeight.bold,fontsize: 20,),
                                  FontHandler("Total stars earned :   "+"089",color: ColorHandler.violate, textAlign:TextAlign.center,fontweight: FontWeight.bold,fontsize: 20,),

                                ]
                            ),
                            SizedBox(
                              width: 40.w,
                            ),


                            SizedBox(
                              width: 90,
                              height: 90,
                              child: CircularProgress()
                            ),
                          ],
                        ),],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,

                  ),



                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                      height: 360,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: FontHandler(
                              "Analysis",
                              color: ColorHandler.normalFont,
                              textAlign: TextAlign.start,
                              fontsize: 22.sp,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,

                          ),
                          ActivityChart(isanalysis:true),
                        ],
                      )
                  ),

                  widget.isanalysis ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: FontHandler(
                              "Today`s Report",
                              color: ColorHandler.normalFont,
                              textAlign: TextAlign.start,
                              fontsize: 22.sp,
                              fontweight: FontWeight.bold,
                            ),
                          ),


                          Padding(

                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReportBar(title: "200",subtitle: "Articles", iconh: IconHandler.artical),
                                ReportBar(title: "200",subtitle: "Articles", iconh: IconHandler.artical),
                                ReportBar(title: "200",subtitle: "Articles", iconh: IconHandler.artical),

                              ],
                            ),
                          ),


                        ],
                      )
                  ):
                  SizedBox(),




                ]),


        )
    );


  }
}



