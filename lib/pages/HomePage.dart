import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/CustomCarousel.dart';
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
          CustomCarousel(url: popularUrl, type: "movie", itemCount: 12),

          Row(children: [SectionTitle(title: "Trending TV Shows")]),
          ListCards(uri: tvTrendingUrl, type: "tv"),

          Row(children: [SectionTitle(title: "Trending Movies")]),
          ListCards(uri: movieTrendingUrl, type: "movie"),

          Row(children: [SectionTitle(title: "Top Rated")]),
          ListCards(uri: tvTopRatedUrl, type: "tv"),

          // Row(children: [SectionTitle(title: "Popular Tv Shows")]),
          // ListCards(tvPopularUrl),
        ],
      ),
    );
  }
}
