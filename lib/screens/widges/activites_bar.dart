import "package:ecard/core/res/color_handler.dart";
import "package:ecard/screens/analysis_screen.dart";
import "package:ecard/screens/subscreen/homeOntap/onActivitytap.dart";
import "package:flutter/material.dart";
import "package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../core/res/font-handler.dart";
import "../chart_screens/activty_chart.dart";

class ActivitesBar extends StatelessWidget {
  const ActivitesBar(
      {super.key,
      required this.FriendName,
      this.FriendLavel = "",
      required this.ImgSrc,
      this.isChatWidge = false});

  final String FriendName;
  final String FriendLavel;
  final String ImgSrc;
  final bool isChatWidge;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.sp,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AnalysisScreen(isanalysis: false,isactivity: true,)));
          },
          child: Card(
            color: (isChatWidge)
                ? ColorHandler.bgColor
                : ColorHandler.normalFont.withOpacity(0.1),
            //color: ColorHandler.bgColor,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SizedBox(
                    width: 50.sp,
                    height: 50.sp,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: Image(
                        image: AssetImage(ImgSrc),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  width: 120,
                  child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontHandler(
                          FriendName,
                          color: ColorHandler.normalFont,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 20.sp,
                        ),
                        FontHandler(
                          FriendLavel,
                          color: Colors.green,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 16.sp,
                        ),
                      ]),
                ),
                Center(
                  child: SizedBox(

                    height: 60,
                    width: 100,
                    child: ActivityChart(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
