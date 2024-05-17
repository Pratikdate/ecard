import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../View/subscreen/Comunity/ChatBotChatScreen.dart';
import '../../View/subscreen/Comunity/CommunityChatScreen.dart';
import '../../View/subscreen/Comunity/SocialPost.dart';

class ChatScreenController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final screens = [
    const SocialPage(),
    CommunityChatPage(),
    const ChatScreenHandler(isComunityPage: false),
  ];

  @override
  void onInit() {
    tabController = TabController(length: screens.length, vsync: this);
    tabController.addListener(handleTabChange);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void handleTabChange() {
    if (!tabController.indexIsChanging) {
      resetScroll();
    }
  }

  void resetScroll() {
    // scrollController.jumpTo(0.0);
    // or use .animateTo() for a smooth scroll
  }
}
