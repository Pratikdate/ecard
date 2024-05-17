import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Monitor/View/LayoutScreens/UserProfilepageLayout/UserInfoNav.dart';
import 'package:Monitor/View/LayoutScreens/UserProfilepageLayout/UserprofileInfo.dart';
import '../Controller/Profile/ProfileController.dart';
import '../Resource/color_handler.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHandler.bgColor,
      ),
      backgroundColor: ColorHandler.bgColor,
      body: Obx(
            () {
          if (controller.userProfile.value == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.sp),
            child: Column(
              children: [
                const UserprofileInfo(),
                SizedBox(height: 10.r),
                Divider(),
                SizedBox(height: 10.r),
                const UserInfoNav(),
              ],
            ),
          );
        },
      ),
    );
  }
}
