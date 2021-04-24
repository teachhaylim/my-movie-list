import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/customWidgets/StarRating.dart';
import 'package:mymovieslist/utils/appConfig.dart';

// ignore: todo
/*TODO 
  make 4 api requests
   - Get Details
   - Get Casts
   - Get Reviews
   - Get Similar Movies

   Async all requests completed, need to organize data to UI
*/

class DetailPage extends StatefulWidget {
  final obj;
  final type;

  const DetailPage({Key? key, required this.obj, required this.type}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    if (widget.type == "movie") {
      getMovieDetail(widget.obj["id"]).then((value) {
        setState(() {
          objDetail = value;
        });
      });

      getMovieCredit(widget.obj["id"]).then((value) {
        setState(() {
          objCredit = value;
        });
      });

      getMovieReview(widget.obj["id"]).then((value) {
        setState(() {
          objReview = value;
        });
      });

      getMovieSimilar(widget.obj["id"]).then((value) {
        setState(() {
          objSimilar = value;
        });
      });
    } else {
      getTVDetail(widget.obj["id"]).then((value) {
        setState(() {
          objDetail = value;
        });
      });

      getTVCredit(widget.obj["id"]).then((value) {
        setState(() {
          objCredit = value;
        });
      });

      getTVReview(widget.obj["id"]).then((value) {
        setState(() {
          objReview = value;
        });
      });

      getTVSimilar(widget.obj["id"]).then((value) {
        setState(() {
          objSimilar = value;
        });
      });
    }
  }

  var objDetail, objCredit, objReview, objSimilar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          objDetail != null
              ? objDetail["title"] != null
                  ? objDetail["title"]
                  : objDetail["name"]
              : widget.type.toUpperCase(),
        ),
      ),
      body: objDetail != null
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  HeaderSection(objDetail: objDetail),
                  TextSection(),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key, required this.objDetail}) : super(key: key);

  final objDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 250,
          width: 160,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl + objDetail["poster_path"],
                placeholder: (context, url) => CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
            margin: const EdgeInsets.all(0),
          ),
        ),
        Expanded(
          child: Container(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      objDetail["title"] != null ? objDetail["title"] : objDetail["name"],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      objDetail["release_date"].toString().substring(0, 4),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: StarRating(
                    rating: getRating(objDetail["vote_average"]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10), child: Text('asds'));
  }
}
