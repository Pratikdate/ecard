import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Resource/icon_handler.dart';
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
          icon: const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              IconHandler.notification,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
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
        // Kebab menu
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert,
                color:
                    CupertinoColors.systemGrey), // Set the icon color to white
            onSelected: (String result) {
              // Handle your menu choice here
              switch (result) {
                case 'Create Post':
                  // Handle create post action
                  break;
                case 'Update Post':
                  // Handle update post action
                  break;
                case 'Delete Post':
                  // Handle delete post action
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Create Post',
                child: Text('Create Post'),
              ),
              const PopupMenuItem<String>(
                value: 'Update Post',
                child: Text('Update Post'),
              ),
              const PopupMenuItem<String>(
                value: 'Delete Post',
                child: Text('Delete Post'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
