import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/res/icon_handler.dart';



class SearchBarWidge extends StatelessWidget {
  const SearchBarWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
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
          title: Text(item),
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
