import 'package:flutter/material.dart';
import 'package:mymovieslist/pages/Layout.dart';
import 'package:mymovieslist/utils/appConfig.dart';

// ignore: todo
//TODO search(if have time)
//BUG Loading Content casue slow performance, mismatch information sometime

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
        fontFamily: 'Roboto-Medium',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: const Color(0xffFFC600),
        highlightColor: Color(0xffffc600),
      ),
      home: Layout(),
    );
  }
}
