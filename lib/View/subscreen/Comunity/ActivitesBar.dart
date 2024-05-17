






import 'dart:ui';

import 'package:Monitor/Controller/ChatScreen/ActivitesBarController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';

class ActivitesBar extends StatelessWidget {
  ActivitesBar({
    Key? key,
    required this.FriendName,
    this.isforSearch = false,
    required this.ImgSrc,
    this.isChatWidge = false,
    required this.Uid,
    this.lastseen = "",
    this.lastmessage = "",
    this.onAddpress,
    required String FriendLavel,
  });

  final String FriendName;
  final bool isforSearch;
  final String ImgSrc;
  final bool isChatWidge;
  final String Uid;
  final String lastseen;
  final String lastmessage;
  final VoidCallback? onAddpress;

  final ActivitesBarController controller = Get.put(ActivitesBarController());



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.r,
      child: InkWell(
        onTap: () {
          controller.navigateToChatScreen(FriendName, ImgSrc, Uid);
        },
        child: Card(
          color: (isChatWidge)
              ? ColorHandler.bgColor
              : ColorHandler.normalFont.withOpacity(0.1),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: SizedBox(
                  width: 40.r,
                  height: 40.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.sp),
                    child: Image.network(
                      ImgSrc,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.sp),
                width: 120.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontHandler(
                      FriendName,
                      color: ColorHandler.normalFont,
                      textAlign: TextAlign.left,
                      fontweight: FontWeight.normal,
                      fontsize: 18.sp,
                    ),
                    FontHandler(
                      lastmessage,
                      color: ColorHandler.normalFont.withOpacity(0.6),
                      textAlign: TextAlign.left,
                      fontweight: FontWeight.normal,
                      fontsize: 12.sp,
                    ),
                  ],
                ),
              ),
              isforSearch ? SizedBox(width: 60.w) : SizedBox(width: 130.w),
              FontHandler(
                lastseen,
                color: ColorHandler.normalFont.withOpacity(0.6),
                textAlign: TextAlign.end,
              ),
              isforSearch
                  ? TextButton(
                onPressed: onAddpress,
                child: const FontHandler(
                  "ADD",
                  color: ColorHandler.normalFont,
                  textAlign: TextAlign.center,
                ),
              )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
