import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Model/snapshot_handler.dart';
import '../../coreRes/color_handler.dart';
import '../../coreRes/font-handler.dart';
import 'ChatBotChatScreen.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key, this.UserConnectionsSnapshot,});
  final UserConnectionsSnapshot;
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return StreamBuilder<QuerySnapshot>(
        stream:  widget.UserConnectionsSnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("something has wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(child: CircularProgressIndicator());
          }

          final List storedocs = [];
          int i = 0;
          int length = 0;

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;

            if(a["uid"]!=auth.currentUser?.uid){
              storedocs.add(a);
              a['id'] = document.id;
            }
          }).toList();
          length = storedocs.length;

          return SizedBox(
            height: height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (var item = 0; item < storedocs.length; item++) ...{
                    ActivitesBar(
                      FriendName: storedocs[item]['name'],
                      ImgSrc: storedocs[item]['image'],
                      Uid: storedocs[item]['uid'],
                      lastseen: '10:2',
                      lastmessage: 'hii whats up', FriendLavel: '',
                    )
                  }
                ],
              ),
            ),
          );
        });
  }
}

class ActivitesBar extends StatelessWidget {
  ActivitesBar(
      {super.key,
      required this.FriendName,
      this.isforSearch=false,
      required this.ImgSrc,
      this.isChatWidge = false,
      required this.Uid,  this.lastseen="",
        this.lastmessage="",
        this.onAddpress, required String FriendLavel
      });

  final String FriendName;
  final bool isforSearch;
  final String ImgSrc;
  final bool isChatWidge;
  final String Uid;
  final String lastseen;
  final String lastmessage;
  final onAddpress;







  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.sp,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreenHandler(
                          FriendName: FriendName,
                          ImgSrc: ImgSrc,
                          Uid: Uid,
                        )));
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
                      child: Image.network(
                        ImgSrc,
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
                          lastmessage,
                          color: ColorHandler.normalFont.withOpacity(0.6),
                          textAlign: TextAlign.left,
                          fontweight: FontWeight.normal,
                          fontsize: 14.sp,
                        ),
                      ]),
                ),
                isforSearch?SizedBox(width: 60.w,):SizedBox(width: 130.w,),
                FontHandler(lastseen, color:ColorHandler.normalFont.withOpacity(0.6), textAlign: TextAlign.end),

                isforSearch ?TextButton(onPressed:onAddpress, child: const FontHandler("ADD",color: ColorHandler.normalFont, textAlign: TextAlign.center,),):const SizedBox(),
              ],
            ),
          ),
        ));
  }
}
