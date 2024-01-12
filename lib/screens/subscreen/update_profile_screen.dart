import 'package:ecard/core/res/icon_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});
  static const routeName = '/Update_profile';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconHandler.angle_left,
            color: Colors.white,
          ),
        ),

        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,

          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(

        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Container(

          padding: EdgeInsets.symmetric(vertical: 38.sp),

          child: Column(
              children: [
                Stack(
                    children: [


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
                            child:  Icon(
                              IconHandler.camera,
                              color: Colors.black,
                              size: 20.sp,
                            ),
                          ),
                        ),









                ]),

                SizedBox(height: 25.sp,),

                Form(
                    child: Column(
                      children: [

                        SizedBox(height: 50.sp,),

                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Full Name"),
                            prefixIcon: Icon(IconHandler.person,),

                          ),
                        ),

                        SizedBox(height: 25.sp,),


                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("E-Mail"),
                            prefixIcon: Icon(IconHandler.mail,),

                          ),
                        ),

                        SizedBox(height: 25.sp,),


                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Phone"),
                            prefixIcon: Icon(IconHandler.phone,),

                          ),
                        ),


                        SizedBox(height: 25.sp,),

                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                            prefixIcon: Icon(IconHandler.pass,),

                          ),
                        ),

                        SizedBox(height: 25.sp,),

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
                      ],
                    ),
                ),

          ]),
        ),
      ),
    );
  }
}
