import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Resource/color_handler.dart';
import '../Resource/icon_handler.dart';
import '../View/analysis_screen.dart';
import '../View/chat_screen.dart';
import '../View/home_screen.dart';
import '../View/my_profile.dart';
import '../View/scan_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/';
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      AnalysisScreen(),
      QRScanScreen(),
      ChatScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
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
        inactiveColorPrimary: ColorHandler.normalFont,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconHandler.message),
        activeColorPrimary: ColorHandler.normalFont,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconHandler.person),
        activeColorPrimary: ColorHandler.normalFont,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: ColorHandler.bgColor.withOpacity(0.3),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style12,
    );
  }
}
