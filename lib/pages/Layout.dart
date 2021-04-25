import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/coreWidget/CustomAppBar.dart';
import 'package:mymovieslist/customWidgets/coreWidget/CustomBottomBar.dart';
import 'package:mymovieslist/pages/HomePage.dart';
import 'package:mymovieslist/pages/MoviePage.dart';
import 'package:mymovieslist/pages/TVPage.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedIndex = 0;

  _onTapButton(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: IndexedStack(
        index: selectedIndex,
        children: <Widget>[
          HomePage(),
          MoviePage(),
          TVPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(selectedIndex: selectedIndex, onTap: _onTapButton),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {
      //     print("Go to search"),
      //     AlertDialog(
      //       title: Text("Seach"),
      //     )
      //   },
      // ),
    );
  }
}
