import 'package:Monitor/View/subscreen/Comunity/ChatBotChatScreen.dart';
import 'package:Monitor/View/subscreen/Comunity/community.dart';
import 'package:Monitor/View/subscreen/Comunity/learnings.dart';
import 'package:Monitor/View/widges/CustomSearchDelegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'coreRes/color_handler.dart';
import 'coreRes/icon_handler.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _screens.length, vsync: this);
    _tabController.addListener(_handleTabChange);

  }

  // Screens to be displayed in each tab
  final List<Widget> _screens = [
    const LearningPage(),
    CommunityPage(
      UserConnectionsSnapshot: FirebaseFirestore.instance
          .collection("User_Connections")
          .doc(FirebaseAuth.instance.currentUser!.uid) // Access the uid property from FirebaseAuth
          .collection("Connections")
          .snapshots(),
    ),
    const ChatScreenHandler(
      isComunityPage: false,
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      _resetScroll();
    }
  }

  void _resetScroll() {
    //_scrollController.jumpTo(0.0);
    //or use .animateTo() for a smooth scroll
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ColorHandler.bgColor,
          appBar: AppBar(
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Comunity"),
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
              leading: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: IconButton(
                          onPressed: () {
                            if (_tabController.index != 1) {
                            } else {
                              showSearch(
                                  context: context,
                                  // delegate to customize the search bar

                                  delegate: CustomSearchDelegate());
                            }
                          },
                          icon: const Icon(IconHandler.search)),
                    ),
                  ],
                ),
              ])),
          body: TabBarView(controller: _tabController, children: _screens),
        ));
  }
}
