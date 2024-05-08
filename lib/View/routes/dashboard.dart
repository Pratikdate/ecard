
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../analysis_screen.dart';
import '../chat_screen.dart';
import '../coreRes/color_handler.dart';
import '../coreRes/icon_handler.dart';
import '../home_screen.dart';
import '../my_profile.dart';
import '../scan_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const routeName = '/';
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [
      HomeScreen(),
      AnalysisScreen(),
      QRScanScreen(),
      ChatScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBaritem() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(IconHandler.NavHome),
        activeColorPrimary: ColorHandler.normalFont,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconHandler.progress),
        activeColorPrimary: ColorHandler.normalFont,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(
            IconHandler.qrScanner,
            color: ColorHandler.normalFont.withOpacity(0.5),
          ),
          activeColorPrimary: ColorHandler.bgColor.withOpacity(0.3),
          inactiveColorPrimary: ColorHandler.normalFont),
      PersistentBottomNavBarItem(
          icon: Icon(IconHandler.message),
          activeColorPrimary: ColorHandler.normalFont,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(IconHandler.person),
          activeColorPrimary: ColorHandler.normalFont,
          inactiveColorPrimary: CupertinoColors.systemGrey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBaritem(),

      confineInSafeArea: true,
      backgroundColor: ColorHandler.bgColor.withOpacity(0.3),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      navBarStyle: NavBarStyle.style12,
    );
  }
}
