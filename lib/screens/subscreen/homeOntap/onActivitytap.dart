import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/res/icon_handler.dart';


class OnActivityTap extends StatefulWidget {
  const OnActivityTap({super.key});

  @override
  State<OnActivityTap> createState() => _OnActivityTapState();
}

class _OnActivityTapState extends State<OnActivityTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
        onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(
    IconHandler.angle_left,
    color: Colors.white,
    ),
    ),
    title: Text(
    " text ",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    ),
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
    ),
    ),
    body: SingleChildScrollView()

    );
  }
}
