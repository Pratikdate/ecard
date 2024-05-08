
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../coreRes/color_handler.dart';
import '../../coreRes/icon_handler.dart';


class OnActivityTap extends StatefulWidget {
  const OnActivityTap({super.key});

  @override
  State<OnActivityTap> createState() => _OnActivityTapState();
}

class _OnActivityTapState extends State<OnActivityTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHandler.bgColor,
        appBar: AppBar(
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
          title: Text(
            " text ",
            style: TextStyle(
              color: ColorHandler.normalFont,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView());
  }
}
