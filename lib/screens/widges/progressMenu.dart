import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/font-handler.dart';

class ProgressMenu extends StatelessWidget{
  const ProgressMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      height: 160.w,
      width: 140.w,
      child: InkWell(
        onTap: (){},
        child: Card(
        color: Colors.white.withOpacity(0.1),
      ),
        ),
    );
  }

}


