import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../widges/VideoPlayerScreen.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<SocialPage> {
  MaterialStatesController _materialStatesController = MaterialStatesController();

  Widget buttonElevated(final text, dynamic onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        statesController: _materialStatesController,
        autofocus: true,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorHandler.bgColor.withOpacity(0.8);
            }
            return ColorHandler.normalFont.withOpacity(0.2);
          }),
        ),
        onPressed: onPress,
        child: FontHandler(
          text,
          color: ColorHandler.normalFont.withOpacity(0.6),
          textAlign: TextAlign.center,
          fontsize: 12,
        ), //function
      ),
    );
  }

  Widget Thumbnails(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoPlayerScreen()));
            },
            child: Image.network(
              "https://www.wowmakers.com/static/e743f3689ca0c0bac8faab39023da37f/4cb25/Video-thumbnail.jpg",
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 10.sp),
                child: SizedBox(
                  width: 45.sp,
                  height: 45.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.sp),
                    child: Image(
                      image: AssetImage("assets/img1.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sizing elements to percentage of screen width/height",
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        style: TextStyle(
                          color: ColorHandler.normalFont,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontHandler("by Pratik Date",
                              color: ColorHandler.normalFont.withOpacity(0.6),
                              textAlign: TextAlign.start),
                          SizedBox(
                            width: 10.sp,
                          ),
                          FontHandler("views 20",
                              color: ColorHandler.normalFont.withOpacity(0.6),
                              textAlign: TextAlign.start),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: constraints.maxWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonElevated("All", () {}),
                    buttonElevated("News", () {}),
                    buttonElevated("Podcast", () {}),
                    buttonElevated("Events", () {}),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.64.sh,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 20.sp),
                child: Column(
                  children: [
                    Thumbnails(context),
                    Thumbnails(context),
                    Thumbnails(context),
                    Thumbnails(context),
                    Thumbnails(context),
                    Thumbnails(context),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
