import 'package:ecard/core/res/color_handler.dart';
import 'package:ecard/core/res/font-handler.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:ecard/screens/home_screen.dart';
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
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: ColorHandler.bgColor,
              appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Recent"),
                      Tab(text: "All"),
                    ],
                  ),
                  toolbarHeight: 80,
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
                              horizontal: 20, vertical: 10),
                          child: SearchBarWidge(),
                        ),
                      ],
                    ),
                  ])),
              body: TabBarView(
                children: [
                  SizedBox(
                    height: height,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ActivitesBar(
                            FriendName: "Gaspard",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Rapier",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Bhavika",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img3.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Dev",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img4.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Arjun",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img5.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Gaspard",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ActivitesBar(
                            FriendName: "Gaspard",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Rapier",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Bhavika",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img3.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Dev",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img4.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Arjun",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img5.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Gaspard",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Rapier",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img1.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Bhavika",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img3.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Dev",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img4.jpg',
                          ),
                          ActivitesBar(
                            FriendName: "Arjun",
                            isChatWidge: true,
                            ImgSrc: 'assets_/img5.jpg',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
