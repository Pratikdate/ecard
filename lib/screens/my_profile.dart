import 'package:ecard/core/authenticat/login.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:ecard/screens/subscreen/virtual_profile_page.dart';
import 'package:ecard/screens/subscreen/update_profile_screen.dart';
import 'package:ecard/screens/widges/profileMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {







    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,


      //body part
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Container(


          padding: EdgeInsets.symmetric(vertical: 8.sp),
          child: Column(
            children: [

              Stack(

                children:
                [
                    SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: const Image(
                        image: AssetImage("assets_/img1.jpg"),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(

                      width: 26.sp,
                      height: 26.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.yellow),
                      child: const Icon(
                        IconHandler.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),


                ]
              ),


              SizedBox(
                height: 10.sp,
              ),
              Text(
                "Coding with T",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                "superadmission@mail.com",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal),
              ),

              SizedBox(
                height: 25.sp,
              ),

              SizedBox(
                width: 200.sp,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent.withAlpha(100),
                      minimumSize: Size(40.sp, 40.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                    ),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateProfileScreen(),
                        ),
                      );
                    },

                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )),
              ),

              SizedBox(
                height: 30.sp,
              ),
              Divider(),
              SizedBox(
                height: 30.sp,
              ),

              //Menu
              ProfileMenuWidget(
                icon: IconHandler.home,
                title: "Page",
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VirtualProfileScreen(),
                    ),
                  );
                },
                endIcon: true,
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                icon: IconHandler.cog,
                title: "Setting",
                onPressed: () {},
                endIcon: true,
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                icon: IconHandler.credit_card,
                title: "Billing Details",
                onPressed: () {},
                endIcon: true,
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                icon: IconHandler.info_circle,
                title: "Information",
                onPressed: () {},
                endIcon: true,
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                icon: IconHandler.logout,
                title: "Logout",
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen(),), (route) => false);
                },
                endIcon: false,
                textColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
