import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/Layout.dart';

//FIXME Loading Content casue slow performance
//TODO either fix the loading issue or change to use Tab Navigation

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyMoviesList',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.purpleAccent,
        primaryColorLight: Colors.pinkAccent,
        primaryColorDark: Colors.greenAccent,
      ),
      home: Layout(),
    );
  }
}
