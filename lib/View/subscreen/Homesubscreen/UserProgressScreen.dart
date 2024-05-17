import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/Home/UserProgressController.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../../Resource/icon_handler.dart';
import '../../LayoutScreens/AnalyticspageLayout/UserStats.dart';
import '../../chart_screens/activty_chart.dart';



class UserProgressScreen extends StatelessWidget {
  const UserProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProgressController controller = Get.put(UserProgressController());

    return Scaffold(
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
      ),
      backgroundColor: ColorHandler.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top name of User
            LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                return UserStats();
              },
            ),
            SizedBox(
              height: 10.r,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 345.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: FontHandler(
                      "Engagement Rate",
                      color: ColorHandler.normalFont,
                      textAlign: TextAlign.start,
                      fontsize: 20.sp,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Obx(() {
                    return ActivityChart(
                      isanalysis: true,
                      engagementRate: controller.engagementRate.value,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
