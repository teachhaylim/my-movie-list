import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/CustomCarousel.dart';
import 'package:mymovieslist/customWidgets/ListCard.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CustomCarousel(url: popularUrl, type: "movie", itemCount: 10),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Popular"),
            )
          ]),
          ListCards(uri: popularUrl, type: "movie"),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Top Rated"),
            )
          ]),
          CustomCarousel(url: topRatedUrl, type: "movie", itemCount: 15),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Now Showing"),
            )
          ]),
          ListCards(uri: showingUrl, type: "movie"),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Upcoming"),
            )
          ]),
          CustomCarousel(url: upcomingUrl, type: "movie", itemCount: 15),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Top Trending"),
            )
          ]),
          ListCards(uri: movieTrendingUrl, type: "movie"),
        ],
      ),
    );
  }
}
