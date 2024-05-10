
import "package:flutter/material.dart";
import "package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../analysis_screen.dart";
import "../chart_screens/activty_chart.dart";
import "../coreRes/color_handler.dart";
import "../coreRes/font-handler.dart";

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
        height: 80.r,
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
                    width: 50.r,
                    height: 50.r,
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
                  width: 120.r,
                  child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontHandler(
                          FriendName,
                          color: ColorHandler.normalFont,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 16.sp,
                        ),
                        FontHandler(
                          FriendLavel,
                          color: Colors.green,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 12.sp,
                        ),
                      ]),
                ),
                Center(
                  child: SizedBox(

                    height: 60.r,
                    width: 100.r,
                    child: ActivityChart(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
