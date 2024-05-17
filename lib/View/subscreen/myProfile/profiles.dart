
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/font-handler.dart';
import '../../../Resource/icon_handler.dart';
import '../authenticat/linkedin.dart';
import '../authenticat/twitter.dart';


class UserProfilesScreen extends StatefulWidget {
  const UserProfilesScreen({super.key});

  @override
  State<UserProfilesScreen> createState() => _UserProfilesScreenState();
}

class _UserProfilesScreenState extends State<UserProfilesScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: ColorHandler.bgColor,
          appBar: AppBar(

            centerTitle: true,
            backgroundColor: ColorHandler.normalFont.withOpacity(0.2),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                IconHandler.angle_left,
                color: ColorHandler.normalFont,
              ),
            ),
            title: Text(
              "Profiles",
              style: TextStyle(
                color: ColorHandler.normalFont,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20,right: 10),

            child: Column(
              children: [
                PlatformProfile(title: "Linkedin", iconh: IconHandler.linkedin,onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LinkedinAuth()), );},),
                PlatformProfile(title: "Twitter", iconh: IconHandler.twitter,onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>TwitterAuth()),);},),
                PlatformProfile(title: "FaceBook", iconh: IconHandler.facebook,onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LinkedinAuth()), );},),
                PlatformProfile(title: "Pinterest", iconh: IconHandler.pinterest,onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LinkedinAuth()), );},),
              ],
            ),

          ));
    }
}



class PlatformProfile extends StatelessWidget {
  const PlatformProfile(
      {super.key,
        required this.title,
        this.subtitle= "",
        required this.iconh,
        required, required this.onPressed,

      });

  final String title;
  final String subtitle;
  final IconData iconh;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onPressed,
      leading: Container(

        width: 50,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: ColorHandler.normalFont.withOpacity(0.1),
        ),
        child: Icon(
          iconh,
          color: ColorHandler.blue,
          size: 40,
        ),
      ),
      title: FontHandler(title,color: ColorHandler.normalFont, textAlign: TextAlign.left,fontsize: 20,),
      trailing: Container(
        width: 30.sp,
        height: 30.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.sp),
          color: Colors.grey.withOpacity(0.1.sp),
        ),
        child: Icon(
          FontAwesome.angle_right,
          size: 20.sp,
          color: Colors.grey,
        ),
      )

    );
  }
}
