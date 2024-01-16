import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/res/icon_handler.dart';



class OnPrcessTap extends StatefulWidget {
  const OnPrcessTap({super.key});

  @override
  State<OnPrcessTap> createState() => _OnPrcessTapState();
}

class _OnPrcessTapState extends State<OnPrcessTap> {
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
