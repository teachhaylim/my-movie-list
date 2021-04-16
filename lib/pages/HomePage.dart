import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:mymovieslist/customWidgets/ListCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(children: [
            SectionTitle(title: "Trending TV Shows"),
          ]),
          ListCards(tvTrendingUrl),
          Row(children: [
            SectionTitle(title: "Trending Movies"),
          ]),
          ListCards(movieTrendingUrl),
          Row(children: [
            SectionTitle(title: "Popular Movies"),
          ]),
          ListCards(popularUrl),
          Row(children: [
            SectionTitle(title: "Popular Tv Shows"),
          ]),
          ListCards(tvPopularUrl),
          Row(children: [
            SectionTitle(title: "Now Showing"),
          ]),
          ListCards(showingUrl),
          Row(children: [
            SectionTitle(title: "Top Rated Movies"),
          ]),
          ListCards(topRatedUrl),
          Row(children: [
            SectionTitle(title: "Upcoming Movies"),
          ]),
          ListCards(upcomingUrl),
          Row(children: [
            SectionTitle(title: "Top Rated TV Shows"),
          ]),
          ListCards(tvTopRatedUrl),
        ],
      ),
    );
  }
}
