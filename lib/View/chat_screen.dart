import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/ChatScreen/ChatScreenController.dart';
import '../Resource/color_handler.dart';
import '../Resource/icon_handler.dart';
import 'package:Monitor/View/subscreen/Comunity/ChatBotChatScreen.dart';
import 'package:Monitor/View/subscreen/Comunity/CommunityChatScreen.dart';
import 'package:Monitor/View/subscreen/Comunity/SocialPost.dart';
import 'package:Monitor/View/widges/CustomSearchDelegate.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatScreenController controller = Get.put(ChatScreenController());

    return Scaffold(
      backgroundColor: ColorHandler.bgColor,
      appBar: AppBar(
        bottom: TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(text: "Community"),
            Tab(text: "Chats"),
            Tab(text: "Chat Bot"),
          ],
        ),
        toolbarHeight: 50,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: Colors.yellow.shade700,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                    onPressed: () {
                      if (controller.tabController.index != 1) {
                      } else {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      }
                    },
                    icon: const Icon(IconHandler.search),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: controller.screens,
      ),
    );
  }
}
