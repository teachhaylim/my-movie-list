import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/CustomCarousel.dart';
import 'package:mymovieslist/customWidgets/ListCard.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class TVPage extends StatefulWidget {
  @override
  _TVPageState createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CustomCarousel(url: tvPopularUrl, type: "tv", itemCount: 10),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Airing Today"),
            )
          ]),
          ListCards(uri: tvAirTodayUrl, type: "tv"),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "On Airing"),
            )
          ]),
          CustomCarousel(url: tvOnAirUrl, type: "tv", itemCount: 15),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Top Rated"),
            )
          ]),
          ListCards(uri: tvTopRatedUrl, type: "tv"),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(title: "Top Rated"),
            )
          ]),
          ListCards(uri: tvTrendingUrl, type: "tv"),
        ],
      ),
    );
  }
}
