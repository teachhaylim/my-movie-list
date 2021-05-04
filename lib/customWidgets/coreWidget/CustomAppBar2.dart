import 'package:flutter/material.dart';
import 'package:mymovieslist/pages/SearchPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appName),
      backgroundColor: accentColor,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchPage());
          },
        )
      ],
    );
  }
}
