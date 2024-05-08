
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../coreRes/color_handler.dart';

class ProfileMenuWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  ProfileMenuWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed,
      required this.endIcon,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: ColorHandler.normalFont.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: ColorHandler.normalFont,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: endIcon
          ? Container(
              width: 30.sp,
              height: 30.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                color: Colors.grey.withOpacity(0.1.sp),
              ),
              child: Icon(
                FontAwesome.angle_right,
                size: 20.sp,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
