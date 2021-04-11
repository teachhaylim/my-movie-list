import 'dart:convert' show json;
import "api/generalApi.dart" as api;
import "appConfig.dart" as app;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

//TODO make dynamica Card with dymaic get request

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
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.yellow,
        // primaryColor: Colors.green,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var data;

  void get() async {
    var response = await http.get(Uri.parse(api.url));

    data = json.decode(response.body)["results"];
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(app.appName),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: "Popular",
              myColor: Colors.red,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in data) MyCard(datas: i),
                ],
              ),
            ),
            SectionTitle(
              title: "Trending",
              myColor: Colors.green,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in data) MyCard(datas: i),
                ],
              ),
            ),
            SectionTitle(
              title: "Now Showing",
              myColor: Colors.blue,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in data) MyCard(datas: i),
                ],
              ),
            ),
            SectionTitle(
              title: "Upcoming",
              myColor: Colors.white,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in data) MyCard(datas: i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, this.title, this.myColor}) : super(key: key);

  final title;
  final Color? myColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.pacifico(
          textStyle: TextStyle(color: myColor, fontSize: 25, letterSpacing: 3),
        ),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  final datas;

  const MyCard({Key? key, required this.datas}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  void show() {
    print(widget.datas);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 250,
      child: GestureDetector(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            api.imageUrl + widget.datas["poster_path"],
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        ),
        onTap: () => show(),
      ),
    );
  }
}
