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
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Trending TV Shows"),
            )
          ]),
          ListCards(uri: tvTrendingUrl, type: "tv"),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Trending Movies"),
            )
          ]),
          ListCards(uri: movieTrendingUrl, type: "movie"),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Top Rated"),
            )
          ]),
          ListCards(uri: tvTopRatedUrl, type: "tv"),
        ],
      ),
    );
  }
}
