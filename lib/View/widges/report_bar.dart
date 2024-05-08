
import "package:flutter/material.dart";
import "package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../chart_screens/CircularProgress.dart";
import "../chart_screens/activty_chart.dart";
import "../coreRes/color_handler.dart";
import "../coreRes/font-handler.dart";
import "../subscreen/homeOntap/onActivitytap.dart";

class ReportBar extends StatelessWidget {
  const ReportBar(
      {super.key,
        required this.title,
        this.subtitle= "",
        required this.iconh,
        });

  final String title;
  final String subtitle;
  final IconData iconh;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const OnActivityTap(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        return child;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80.sp,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                _createRoute());  },
          child: Card(
            color:ColorHandler.normalFont.withOpacity(0.1),

            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SizedBox(
                    width: 50.sp,
                    height: 50.sp,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: Icon(
                        iconh
                      )
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
                         title,
                          color: ColorHandler.normalFont,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 20.sp,
                        ),
                        FontHandler(
                          subtitle,
                          color: Colors.green,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 16.sp,
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80),

                  child: SizedBox(

                    height: 60,
                    width: 60,
                    child: CircularProgress(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
