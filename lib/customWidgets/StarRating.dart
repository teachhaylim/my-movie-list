import 'package:flutter/material.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  StarRating({this.starCount = 5, this.rating = .0});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;

    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: accentColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: accentColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: accentColor,
      );
    }

    return new InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
