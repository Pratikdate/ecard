
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../View/subscreen/Comunity/ChatBotChatScreen.dart';

class ActivitesBarController extends GetxController {
  void navigateToChatScreen(String friendName, String imgSrc, String uid) {
    Get.to(() => ChatScreenHandler(
      FriendName: friendName,
      ImgSrc: imgSrc,
      Uid: uid,
    ));
  }
}