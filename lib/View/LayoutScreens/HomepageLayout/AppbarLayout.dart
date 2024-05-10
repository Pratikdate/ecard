import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../coreRes/icon_handler.dart';
import '../../home_screen.dart';
import '../../widges/CustomSearchDelegate.dart';

class AppbarLayout extends StatefulWidget {
  const AppbarLayout({super.key});

  @override
  State<AppbarLayout> createState() => _AppbarLayoutState();
}

class _AppbarLayoutState extends State<AppbarLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Navigation icons
        IconButton(
          onPressed: () {
            // Navigate to home screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          icon: const Icon(
            IconHandler.notification,
            color: CupertinoColors.systemGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              // Show search bar
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              IconHandler.search,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      ],
    );
  }
}
