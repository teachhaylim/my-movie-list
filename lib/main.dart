import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/Layout.dart';
import 'package:mymovieslist/utils/appConfig.dart';

// ignore: todo
//TODO Item Detail Page, search(if have time)
//BUG Loading Content casue slow performance
//DONE Make Carousel Clickable
//DONE HomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: accentColor,
        primaryColorLight: primaryLight,
        primaryColorDark: primaryDark,
      ),
      home: Layout(),
    );
  }
}
