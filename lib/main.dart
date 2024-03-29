import 'package:ecard/core/authenticat/login.dart';
import 'package:ecard/screens/home_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

//app look like
//https://dribbble.com/shots/18612909-Fitness-Mobile-App/attachments/13805828?mode=media

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialisation=Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: _initialisation,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("something went wrong");


          }
          if(snapshot.connectionState==ConnectionState.done){
            return ScreenUtilInit(
                designSize: const Size(392.72, 834.90),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return MaterialApp(
                    debugShowMaterialGrid: false,
                    debugShowCheckedModeBanner: false,
                    title: "Personal Brand Manager",
                    theme: ThemeData(
                      primarySwatch: Colors.grey,
                    ),
                    initialRoute: '/login',

                    routes: {
                      LoginScreen.routeName:(context)=>LoginScreen(),
                      HomeScreen.routeName:(context)=>HomeScreen()

                    },
                  );
                });
          }
          return CircularProgressIndicator();

        }
    );




  }
}
