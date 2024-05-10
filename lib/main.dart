import 'package:device_preview/device_preview.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'View/home_screen.dart';
import 'View/subscreen/authenticat/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    enabled: true,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (BuildContext context) => MyApp(),
  ));
}

//app look like
//https://dribbble.com/shots/18612909-Fitness-Mobile-App/attachments/13805828?mode=media

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialisation = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: _initialisation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ScreenUtilInit(
                designSize: const Size(392.72, 834.90),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return MaterialApp(
                    useInheritedMediaQuery: true,
                    locale: DevicePreview.locale(context),
                    builder: DevicePreview.appBuilder,
                    debugShowMaterialGrid: false,
                    debugShowCheckedModeBanner: false,
                    title: "Personal Brand Manager",
                    theme: ThemeData(
                      primarySwatch: Colors.grey,
                    ),
                    initialRoute: FirebaseAuth.instance.currentUser == null
                        ? LoginScreen.routeName
                        : HomeScreen.routeName,
                    routes: {
                      LoginScreen.routeName: (context) => LoginScreen(),
                      HomeScreen.routeName: (context) => HomeScreen()
                    },
                  );
                });
          }
          return CircularProgressIndicator();
        });
  }
}
