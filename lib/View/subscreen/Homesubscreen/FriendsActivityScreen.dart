
import 'package:Monitor/View/LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../LayoutScreens/AnalyticspageLayout/UserStats.dart';
import '../../chart_screens/CircularProgress.dart';
import '../../chart_screens/activty_chart.dart';
import '../../coreRes/color_handler.dart';
import '../../coreRes/font-handler.dart';
import '../../coreRes/icon_handler.dart';


class FriendsActivityScreen extends StatefulWidget {
  const FriendsActivityScreen({super.key});

  @override
  State<FriendsActivityScreen > createState() => _OnActivityTapState();
}

class _OnActivityTapState extends State<FriendsActivityScreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
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
            LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  return UserProgressBarLayout();
                }),
            SizedBox(
              height: 20.r,
            ),

            LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  return UserStats();
                }),
            SizedBox(
              height: 10.r,
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


          ]),
        ));
  }
}
