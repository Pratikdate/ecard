
import 'package:Monitor/View/widges/report_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chart_screens/CircularProgress.dart';
import 'chart_screens/activty_chart.dart';
import 'coreRes/color_handler.dart';
import 'coreRes/font-handler.dart';
import 'coreRes/icon_handler.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({
    super.key,
    this.isanalysis = true,
    this.isprogress = false,
    this.isactivity = false,
  });
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
        appBar:  widget.isanalysis?AppBar(
          toolbarHeight: 60,
          leadingWidth: MediaQuery.of(context).size.width,
          backgroundColor: ColorHandler.bgColor,
        ):
        AppBar(
        centerTitle: true,
        backgroundColor: ColorHandler.bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconHandler.angle_left,
            color: ColorHandler.normalFont,
          ),
        ),
    ),

        backgroundColor: ColorHandler.bgColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Top name of User
            widget.isactivity
                ? Column(
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
                  )
                : const SizedBox(),
            widget.isactivity
                ? SizedBox(
                    height: 6.w,
                  )
                : const SizedBox(),

            //Progress bar
            widget.isactivity
                ? Container(
                    height: 80.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Card(
                      color: ColorHandler.normalFont.withOpacity(0.1),
                      child: Row(
                        children: [
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
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
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: SizedBox(
                                    width: 240.w,
                                    child: FAProgressBar(
                                        currentValue: 80.sp,
                                        size: 8.sp,
                                        backgroundColor:
                                            ColorHandler.normalFont,
                                        progressGradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.purple.shade300,
                                              Colors.deepPurpleAccent
                                                  .withAlpha(100)
                                            ])),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),

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
                      const Column(children: [
                        FontHandler(
                          "Total Impressions :",
                          color: ColorHandler.violate,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                        ),
                        FontHandler(
                          "Total Likes             :",
                          color: ColorHandler.violate,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                        ),
                        FontHandler(
                          "Total Followers     :",
                          color: ColorHandler.violate,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                        ),
                        FontHandler(
                          "Total Comments   :",
                          color: ColorHandler.violate,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                        ),
                        FontHandler(
                          "Total Shares          :",
                          color: ColorHandler.violate,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                        ),


                      ]
                      ),
                      const Column(
                        children: [
                          FontHandler("100",
                            color: ColorHandler.violate,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                          ),
                          FontHandler("100",
                            color: ColorHandler.violate,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                          ),FontHandler("100",
                            color: ColorHandler.violate,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                          ),FontHandler("100",
                            color: ColorHandler.violate,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                          ),FontHandler("100",
                            color: ColorHandler.violate,
                            textAlign: TextAlign.left,
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      const SizedBox(
                          width: 90, height: 90, child: CircularProgress()),
                    ],
                  ),
                ],
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
                        "Engagement Rate",
                        color: ColorHandler.normalFont,
                        textAlign: TextAlign.start,
                        fontsize: 22.sp,
                        fontweight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ActivityChart(isanalysis: true),
                  ],
                )),

            widget.isanalysis
                ? SizedBox(
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
                        SizedBox(
                          height: 270.h,
                          child: const SingleChildScrollView(
                            padding: EdgeInsets.only(left: 10.0,right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReportBar(
                                    title: "Linkedin",
                                    subtitle: "positive",
                                    iconh: IconHandler.linkedin),
                                ReportBar(
                                    title: "Twitter",
                                    subtitle: " neutral",
                                    iconh: IconHandler.twitter),
                                ReportBar(
                                    title: "Facebook",
                                    subtitle: "negative",
                                    iconh: IconHandler.facebook),
                                ReportBar(
                                    title: "Pinterest",
                                    subtitle: "neutral",
                                    iconh: IconHandler.pinterest),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                : const SizedBox(),
          ]),
        ));
  }
}
