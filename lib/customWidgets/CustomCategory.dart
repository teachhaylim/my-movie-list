import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovieslist/pages/GenrePage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class CustomCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 4,
        children: <Widget>[
          for (var i in genres.take(8).toList()) GCard(obj: i),
        ],
      ),
    );
  }
}

class GCard extends StatelessWidget {
  const GCard({Key? key, required this.obj}) : super(key: key);

  final obj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.grey.shade800,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                child: SvgPicture.asset(obj["icon"], color: obj["color"]),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    obj["name"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
            child: GenrePage(genreID: obj["id"], genreName: obj["name"]),
          ),
        );
      },
    );
  }
}
