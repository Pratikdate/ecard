import 'package:ecard/core/res/color_handler.dart';
import 'package:ecard/core/res/font-handler.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:ecard/screens/home_screen.dart';
import 'package:ecard/screens/subscreen/Comunity/chatScreenHandler.dart';
import 'package:ecard/screens/subscreen/Comunity/community.dart';
import 'package:ecard/screens/subscreen/Comunity/learnings.dart';
import 'package:ecard/screens/widges/activites_bar.dart';
import 'package:ecard/screens/widges/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: ColorHandler.bgColor,
              appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Learnings"),
                      Tab(text: "Comunity"),
                      Tab(text: "Chat Bot"),

                    ],
                  ),
                  toolbarHeight: 50,
                  leadingWidth: MediaQuery.of(context).size.width,
                  backgroundColor: Colors.yellow.shade700,
                  shape: RoundedRectangleBorder(
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
                              horizontal: 20,),
                          child: SearchBarWidge(),
                        ),
                      ],
                    ),
                  ])),
              body: TabBarView(
                children: [


                  LearningPage(),
                  CommunityPage(),
                  ChatScreenHandler(isComunityPage: false,),







                ],
              ),
            )));
  }
}
