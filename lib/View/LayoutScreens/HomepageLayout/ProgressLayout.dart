import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../../Resource/icon_handler.dart';
import '../../widges/progressMenu.dart';


class ProgressLayout extends StatelessWidget {
  const ProgressLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return // Progress bar
      Container(
        margin: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress section title
            FontHandler(
              "Progress",
              color: ColorHandler.normalFont,
              textAlign: TextAlign.start,
              fontsize: 20.sp,
              fontweight: FontWeight.normal,
            ),
            // Progress menu items
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Progress menu items
                  ProgressMenu(
                    progress: "good",
                    progressicon: IconHandler.artical,
                    progressiconcolor: ColorHandler.blue,
                    progressname: "Post",
                    aboutprogress: "Overall Quality",
                  ),
                  ProgressMenu(
                    progress: "260",
                    progressicon: IconHandler.view,
                    progressiconcolor: ColorHandler.violate,
                    progressname: "Views",
                    aboutprogress: "Maximum Views",
                  ),
                  ProgressMenu(
                    progress: "27",
                    progressicon: IconHandler.like,
                    progressiconcolor: ColorHandler.yellow,
                    progressname: "Likes",
                    aboutprogress: "Maximum Likes",
                  ),
                  ProgressMenu(
                    progress: "8",
                    progressicon: IconHandler.comment,
                    progressiconcolor: ColorHandler.pink,
                    progressname: "Comments",
                    aboutprogress: "Maximum Comments",
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
