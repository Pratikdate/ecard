import 'package:ecard/screens/subscreen/Comunity/chatScreenHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/res/color_handler.dart';
import '../../../core/res/font-handler.dart';


class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ActivitesBar(
              FriendName: "Gaspard",
              isChatWidge: true,
              ImgSrc: 'assets/img1.jpg',

            ),
            ActivitesBar(
              FriendName: "Rapier",
              isChatWidge: true,
              ImgSrc: 'assets/img1.jpg',
            ),
            ActivitesBar(
              FriendName: "Bhavika",
              isChatWidge: true,
              ImgSrc: 'assets/img3.jpg',
            ),
            ActivitesBar(
              FriendName: "Dev",
              isChatWidge: true,
              ImgSrc: 'assets/img4.jpg',
            ),
            ActivitesBar(
              FriendName: "Arjun",
              isChatWidge: true,
              ImgSrc: 'assets/img5.jpg',
            ),
            ActivitesBar(
              FriendName: "Gaspard",
              isChatWidge: true,
              ImgSrc: 'assets/img1.jpg',
            ),
            ActivitesBar(
              FriendName: "Rapier",
              isChatWidge: true,
              ImgSrc: 'assets/img1.jpg',
            ),
            ActivitesBar(
              FriendName: "Bhavika",
              isChatWidge: true,
              ImgSrc: 'assets/img3.jpg',
            ),
            ActivitesBar(
              FriendName: "Dev",
              isChatWidge: true,
              ImgSrc: 'assets/img4.jpg',
            ),
            ActivitesBar(
              FriendName: "Arjun",
              isChatWidge: true,
              ImgSrc: 'assets/img5.jpg',
            ),
          ],
        ),
      ),
    );
  }
}







class ActivitesBar extends StatelessWidget {
  const ActivitesBar(
      {super.key,
        required this.FriendName,
        this.FriendLavel = "",
        required this.ImgSrc,
        this.isChatWidge = false});

  final String FriendName;
  final String FriendLavel;
  final String ImgSrc;
  final bool isChatWidge;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.sp,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatScreenHandler()));
          },
          child: Card(
            color: (isChatWidge)
                ? ColorHandler.bgColor
                : ColorHandler.normalFont.withOpacity(0.1),
            //color: ColorHandler.bgColor,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SizedBox(
                    width: 50.sp,
                    height: 50.sp,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: Image(
                        image: AssetImage(ImgSrc),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  width: 120,
                  child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontHandler(
                          FriendName,
                          color: ColorHandler.normalFont,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 20.sp,
                        ),
                        FontHandler(
                          FriendLavel,
                          color: Colors.green,
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 16.sp,
                        ),
                      ]),
                ),

              ],
            ),
          ),
        ));
  }
}
