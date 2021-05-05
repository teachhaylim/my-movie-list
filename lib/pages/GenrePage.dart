import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/customWidgets/CustomGenreCard.dart';
import 'package:mymovieslist/customWidgets/StarRating.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'dart:math';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({Key? key, required this.genreID, required this.genreName, this.itemCount}) : super(key: key);

  final genreID;
  final itemCount;
  final genreName;

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    super.initState();
    getMovieByGenre(widget.genreID).then((value) {
      setState(() {
        datas = value.take(widget.itemCount ?? 20).toList();
      });
    });
  }

  var datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genreName),
      ),
      body: datas != null
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (var i in datas) TileCard(obj: i),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class TileCard extends StatelessWidget {
  const TileCard({Key? key, required this.obj}) : super(key: key);

  final obj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
            child: DetailPage(objID: obj["id"]),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(Random().nextInt(0xffffffff)),
          ),
          child: Row(
            children: [
              TileCardImage(obj: obj),
              TileCardInfo(obj: obj),
            ],
          ),
        ),
      ),
    );
  }
}

class TileCardInfo extends StatelessWidget {
  const TileCardInfo({Key? key, required this.obj}) : super(key: key);

  final obj;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8),
            child: Text(
              obj["title"],
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                obj["release_date"],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: StarRating(rating: getRating(obj["vote_average"].toDouble())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TileCardImage extends StatelessWidget {
  const TileCardImage({Key? key, required this.obj}) : super(key: key);

  final obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl + obj["poster_path"],
            placeholder: (context, url) => CircularProgressIndicator.adaptive(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 6,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      ),
    );
  }
}
