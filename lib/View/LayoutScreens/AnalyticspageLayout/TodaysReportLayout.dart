import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../../Resource/icon_handler.dart';
import '../../widges/report_bar.dart';


class TodaysReportLayout extends StatefulWidget {
  const TodaysReportLayout({super.key});

  @override
  State<TodaysReportLayout> createState() => _TodaysReportLayoutState();
}

class _TodaysReportLayoutState extends State<TodaysReportLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Column(
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
      ],
    );
  }
}
