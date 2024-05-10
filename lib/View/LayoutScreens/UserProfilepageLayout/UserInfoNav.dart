import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../coreRes/color_handler.dart';
import '../../coreRes/icon_handler.dart';
import '../../subscreen/authenticat/login.dart';
import '../../subscreen/myProfile/profiles.dart';
import '../../subscreen/myProfile/virtual_profile_page.dart';
import '../../widges/profileMenu.dart';


class UserInfoNav extends StatefulWidget {
  const UserInfoNav({super.key});

  @override
  State<UserInfoNav> createState() => _UserInfoNavState();
}

class _UserInfoNavState extends State<UserInfoNav> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height<732?0.36.sh:0.42.sh,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileMenuWidget(
              icon: IconHandler.home,
              title: "Page",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VirtualProfileScreen(),
                  ),);

              },

              endIcon: true,
              textColor: ColorHandler.normalFont,
            ),
            ProfileMenuWidget(
              icon: IconHandler.cog,
              title: "Setting",
              onPressed: () {},
              endIcon: true,
              textColor: ColorHandler.normalFont,
            ),
            ProfileMenuWidget(
              icon: IconHandler.credit_card,
              title: "Billing Details",
              onPressed: () {},
              endIcon: true,
              textColor: ColorHandler.normalFont,
            ),
            ProfileMenuWidget(
              icon: IconHandler.info_circle,
              title: "Information",
              onPressed: () {},
              endIcon: true,
              textColor: ColorHandler.normalFont,
            ),
            ProfileMenuWidget(
              icon: IconHandler.artical,
              title: "Profiles",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserProfilesScreen()));

              },
              endIcon: true,
              textColor: ColorHandler.normalFont,
            ),
            ProfileMenuWidget(
              icon: IconHandler.logout,
              title: "Logout",
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                Phoenix.rebirth(context);
              },
              endIcon: false,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
