import 'package:device_preview/device_preview.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Routes/dashboard.dart';
import 'View/home_screen.dart';
import 'View/subscreen/authenticat/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    Phoenix(
      child: DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (BuildContext context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Your Brand, Your Power",
          theme: ThemeData(
            primarySwatch: Colors.grey,
            // Define your own color scheme if needed
            // colorScheme: ColorScheme.fromSwatch(
            //   primarySwatch: Colors.grey,
            // ).copyWith(
            //   secondary: accentColor,
            // ),
          ),
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? LoginScreen.routeName
              : HomeScreen.routeName,
          getPages: [
            GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
            GetPage(name: HomeScreen.routeName, page: () => DashboardScreen()),
          ],
        );
      },
    );
  }
}
