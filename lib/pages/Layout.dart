import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/coreWidget/CustomAppBar.dart';
import 'package:mymovieslist/pages/HomePage.dart';
import 'package:mymovieslist/pages/SearchPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.search,
            size: 30,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [accentColor, primaryDark])),
        ),
        onPressed: () {
          showSearch(context: context, delegate: SearchPage());
        },
      ),
    );
  }
}
