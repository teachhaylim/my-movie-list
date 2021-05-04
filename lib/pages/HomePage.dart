import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/CustomCarousel.dart';
import 'package:mymovieslist/customWidgets/CustomCategory.dart';
import 'package:mymovieslist/customWidgets/GernricTitle.dart';
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
          CustomCarousel(url: upcomingUrl, itemCount: 10),
          GernicTitle(title: "Genre"),
          CustomCategory(),
          GernicTitle(title: "Popular"),
          ListCards(uri: popularUrl),
          GernicTitle(title: "Now Showing"),
          ListCards(uri: showingUrl),
          GernicTitle(title: "Top Rated"),
          CustomCarousel(url: topRatedUrl, itemCount: 15),
          GernicTitle(title: "Top Trending"),
          ListCards(uri: movieTrendingUrl),
        ],
      ),
    );
  }
}
