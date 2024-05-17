import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package
import '../../Controller/Home/ActivityBarController.dart';
import '../../Resource/color_handler.dart';
import '../../Resource/font-handler.dart';
import '../analysis_screen.dart';
import '../chart_screens/activty_chart.dart';
import '../subscreen/Homesubscreen/FriendsActivityScreen.dart';


class ActivitesBar extends StatelessWidget {
  const ActivitesBar({
    Key? key,
    required this.friendName,
    this.friendLevel = '',
    required this.imgSrc,
    this.isChatWidge = false,
  }) : super(key: key);

  final String friendName;
  final String friendLevel;
  final String imgSrc;
  final bool isChatWidge;

  @override
  Widget build(BuildContext context) {
    // Get reference to controller
    final ActivitiesController controller = Get.put(ActivitiesController());

    return Container(
      height: 80.r,
      child: InkWell(
        onTap: () {
          // Use Get.to instead of Navigator.push to navigate to screen
          Get.to(() => const FriendsActivityScreen());
        },
        child: Card(
          color: isChatWidge
              ? ColorHandler.bgColor
              : ColorHandler.normalFont.withOpacity(0.1),
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
                      image: AssetImage(imgSrc),
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
                      friendName,
                      color: ColorHandler.normalFont,
                      textAlign: TextAlign.left,
                      fontweight: FontWeight.normal,
                      fontsize: 16.sp,
                    ),
                    FontHandler(
                      friendLevel,
                      color: Colors.green,
                      textAlign: TextAlign.left,
                      fontweight: FontWeight.normal,
                      fontsize: 12.sp,
                    ),
                  ],
                ),
              ),
              // Use Obx or GetX builder to update UI reactively
              Obx(() => SizedBox(
                height: 60.r,
                width: 100.r,
                child: ActivityChart(engagementRate: controller.engagementRate.value),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
