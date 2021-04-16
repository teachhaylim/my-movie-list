import 'package:flutter/material.dart';
import 'package:mymovieslist/pages/HomePage.dart';
import 'package:mymovieslist/pages/MoviePage.dart';
import 'package:mymovieslist/pages/TVPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedIndex = 0;

  static List<Widget> showWidget = <Widget>[
    HomePage(),
    MoviePage(),
    TVPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text(
          appName,
          style: GoogleFonts.fredokaOne(
            textStyle: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                letterSpacing: 3),
          ),
        ),
      ),
      body: showWidget[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? new Icon(Icons.home_outlined)
                : new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? new Icon(Icons.movie_outlined)
                : new Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? new Icon(Icons.live_tv)
                : new Icon(Icons.tv),
            label: 'Tv Show',
          ),
        ],
        currentIndex: selectedIndex,
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
