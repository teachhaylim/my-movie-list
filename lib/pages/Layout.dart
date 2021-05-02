import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/coreWidget/CustomAppBar.dart';
import 'package:mymovieslist/customWidgets/coreWidget/CustomBottomBar.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'package:mymovieslist/pages/MoviePage.dart';
import 'package:mymovieslist/pages/SearchPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: MoviePage(),
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
        onPressed: () => {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              alignment: Alignment.center,
              child: SearchPage(),
            ),
          )
        },
      ),
    );
  }
}
