import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecard/core/res/icon_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {


  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userphone = TextEditingController();
  final userabout = TextEditingController();

  final _formkey=GlobalKey<FormState>();

  var name;
  var email;
  var phone;
  var about;


  CollectionReference User_profile = FirebaseFirestore.instance.collection("User_Profiles");
  Future<void> setProfile() async {
    try {
      await User_profile.doc(phone).set({
        "name": name,
        "email": email,
        "phone": phone,
        "about": about,
      }).then((value) => print("user delete")).catchError(() => print("Fail delete user"));
    } catch (e) {
      print(name);
      print(email);


    }
  }


  @override
  Widget build(BuildContext context) {
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
          child: Column(children: [
            Stack(children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.sp),
                  child: Image(
                    image: AssetImage("assets_/img1.jpg"),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    width: 24.sp,
                    height: 24.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: Colors.yellow),
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 0),
                      onPressed: () {},
                      icon: Icon(
                        IconHandler.camera,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    )),
              ),
            ]),
            SizedBox(
              height: 25.sp,
            ),
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      label: Text("Full Name"),
                      prefixIcon: Icon(
                        IconHandler.person,
                      ),
                    ),
                    controller: userName,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("E-Mail"),
                      prefixIcon: Icon(
                        IconHandler.mail,
                      ),
                    ),
                    controller: userEmail,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Phone"),
                      prefixIcon: Icon(
                        IconHandler.phone,
                      ),
                    ),
                    controller: userphone,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("About"),
                      prefixIcon: Icon(
                        IconHandler.pass,
                      ),
                    ),
                    controller: userabout,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  SizedBox(
                    width: 200.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.deepPurpleAccent.withAlpha(100),
                          minimumSize: Size(40.sp, 40.sp),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                        onPressed: () {
                        //if(_formkey.currentState!.validate()){


                            try{
                              setState(() {
                                name=userName.text;
                                email=userEmail.text;
                                phone=userphone.text;
                                about=userabout.text;
                              });
                              setProfile();
                              Navigator.pop(context);
                            }catch(e){}






                        },
                        child: Text(
                          "Edit Profile",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
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


