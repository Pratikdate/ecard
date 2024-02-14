import 'package:ecard/core/res/color_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/res/icon_handler.dart';



class SearchBarWidge extends StatefulWidget {
  const SearchBarWidge({super.key});

  @override
  State<SearchBarWidge> createState() => _SearchBarWidgeState();
}

class _SearchBarWidgeState extends State<SearchBarWidge> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: true,
      viewBackgroundColor: ColorHandler.bgColor,
        builder: (BuildContext context, SearchController controller) {
          return IconButton(onPressed: () { controller.openView(); }, icon: Icon(IconHandler.search,color: CupertinoColors.systemGrey,),);

          // return SearchBar(
          //   controller: controller,
          //   padding: const MaterialStatePropertyAll<EdgeInsets>(
          //       EdgeInsets.symmetric(horizontal: 10,vertical: 6)),
          //   onTap: () {
          //     controller.openView();
          //   },
          //   onChanged: (_) {
          //     controller.openView();
          //   },
          //   leading: const Icon(Icons.search),
          //   constraints: BoxConstraints(minWidth: 120.0, maxWidth: 180.0, minHeight: 16.0),
          //
          // );
        }, suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item,style: TextStyle(color: ColorHandler.normalFont),),
          onTap: () {
            // setState(() {
            //   controller.closeView(item);
            // });
          },
        );
      });
    });
  }


}
