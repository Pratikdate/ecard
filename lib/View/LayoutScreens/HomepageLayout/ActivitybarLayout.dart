import 'package:flutter/material.dart';
import 'package:Monitor/View/LayoutScreens/HomepageLayout/AppbarLayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../coreRes/color_handler.dart';
import '../../coreRes/font-handler.dart';
import '../../home_screen.dart';
import 'package:Monitor/View/widges/activity_bar.dart';

class ActivitybarLayout extends StatelessWidget {
  const ActivitybarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Friends activity section title
          FontHandler(
            "Friends Activity",
            color: ColorHandler.normalFont,
            textAlign: TextAlign.start,
            fontsize: 20.sp,
            fontweight: FontWeight.normal,
          ),
          // Friends activity list
          FadedEdges(
            child: Builder(builder: (context) {

              if(MediaQuery.of(context).size.height >= 800 && MediaQuery.of(context).size.height < 860){
                return SizedBox(
                  height: 300.r-37,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        // Individual friend activity bars
                        ActivitesBar(
                          FriendName: "Gaspard",
                          FriendLavel: "Lv2",
                          ImgSrc: 'assets/img1.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Rapier",
                          FriendLavel: "Lv3",
                          ImgSrc: 'assets/img1.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Bhavika",
                          FriendLavel: "Lv4",
                          ImgSrc: 'assets/img3.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Dev",
                          FriendLavel: "Lv3",
                          ImgSrc: 'assets/img4.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Arjun",
                          FriendLavel: "Lv1",
                          ImgSrc: 'assets/img5.jpg',
                        ),
                      ],
                    ),
                  ),
                );
              }
              else if(MediaQuery.of(context).size.height > 860){
                return SizedBox(
                  height: 0.38.sh,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        // Individual friend activity bars
                        ActivitesBar(
                          FriendName: "Gaspard",
                          FriendLavel: "Lv2",
                          ImgSrc: 'assets/img1.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Rapier",
                          FriendLavel: "Lv3",
                          ImgSrc: 'assets/img1.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Bhavika",
                          FriendLavel: "Lv4",
                          ImgSrc: 'assets/img3.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Dev",
                          FriendLavel: "Lv3",
                          ImgSrc: 'assets/img4.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Arjun",
                          FriendLavel: "Lv1",
                          ImgSrc: 'assets/img5.jpg',
                        ),
                      ],
                    ),
                  ),
                );

              }
              else{
                return SizedBox(
                  height:0.29.sh,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        // Individual friend activity bars
                        ActivitesBar(
                          FriendName: "Gaspard",
                          FriendLavel: "Lv2",
                          ImgSrc: 'assets/img1.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Rapier",
                          FriendLavel: "Lv3",
                          ImgSrc: 'assets/img1.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Bhavika",
                          FriendLavel: "Lv4",
                          ImgSrc: 'assets/img3.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Dev",
                          FriendLavel: "Lv3",
                          ImgSrc: 'assets/img4.jpg',
                        ),
                        ActivitesBar(
                          FriendName: "Arjun",
                          FriendLavel: "Lv1",
                          ImgSrc: 'assets/img5.jpg',
                        ),
                      ],
                    ),
                  ),
                );

              }




            }),
          ),
        ],
      ),
    );
  }
}
