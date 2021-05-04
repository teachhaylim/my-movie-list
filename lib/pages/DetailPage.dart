import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';
import 'package:mymovieslist/customWidgets/StarRating.dart';
import 'package:mymovieslist/customWidgets/detailPage/CastAvatar.dart';
import 'package:mymovieslist/customWidgets/detailPage/FormText.dart';
import 'package:mymovieslist/customWidgets/detailPage/ReviewCard.dart';
import 'package:mymovieslist/customWidgets/detailPage/SimilarCard.dart';
import 'package:mymovieslist/pages/Layout.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class DetailPage extends StatefulWidget {
  final objID;

  const DetailPage({Key? key, required this.objID}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    getMovieDetail(widget.objID).then((value) {
      setState(() {
        objDetail = value;
      });
    });

    getMovieCredit(widget.objID).then((value) {
      setState(() {
        objCredit = value;
      });
    });

    getMovieReview(widget.objID).then((value) {
      setState(() {
        objReview = value;
      });
    });

    getMovieSimilar(widget.objID).then((value) {
      setState(() {
        objSimilar = value.take(8).toList();
      });
    });
  }

  var objDetail, objCredit, objReview, objSimilar;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Layout()),
            (Route<dynamic> route) => false,
          ),
        ),
        title: Text("Movie"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: objDetail != null && objCredit != null && objReview != null && objSimilar != null
            ? Page(
                size: size,
                objDetail: objDetail,
                objCredit: objCredit,
                objReview: objReview,
                objSimilar: objSimilar,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, required this.size, required this.objDetail, required this.objCredit, required this.objReview, required this.objSimilar}) : super(key: key);

  final Size size;
  final objDetail;
  final objCredit;
  final objReview;
  final objSimilar;

  bool checkUrl(str) {
    return str.contains("https://");
  }

  checkAvatar(obj) {
    return obj["author_details"]["avatar_path"] != null
        ? checkUrl(obj["author_details"]["avatar_path"])
            ? obj["author_details"]["avatar_path"].substring(1, obj["author_details"]["avatar_path"].length)
            : imageUrl + obj["author_details"]["avatar_path"]
        : blankProfile;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Container(
                  height: 280,
                  width: size.width * 0.425,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
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
                ),
                Container(
                  height: 280,
                  width: size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(objDetail["title"], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(objDetail["release_date"], style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                        ),
                        StarRating(rating: getRating(objDetail["vote_average"])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormText(label: "Director", value: getArr(objCredit["crew"], "job", "director", "name")),
                FormText(label: "Genre", value: getValue(objDetail["genres"], "name")),
                FormText(label: "Studio", value: getValue(objDetail["production_companies"], "name")),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            height: 10,
            thickness: 3,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
          Container(
            child: Text(
              objDetail["overview"],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            height: 10,
            thickness: 3,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          SectionTitle(title: "Cast"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i in objCredit["cast"])
                  CastAvatar(
                    name: i["name"],
                    imageUrl: i["profile_path"] != null ? imageUrl + i["profile_path"] : blankProfile,
                    character: i["character"],
                  ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 3,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          if (objReview.length != 0) SectionTitle(title: "Reviews"),
          if (objReview.length != 0)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in objReview)
                    ReviewCard(
                      name: i["author"],
                      description: i["content"],
                      rating: i["author_details"]["rating"] != null ? i["author_details"]["rating"] : 0,
                      imageUrl: checkAvatar(i),
                    ),
                ],
              ),
            ),
          if (objReview.length != 0)
            Divider(
              height: 10,
              thickness: 3,
              color: Colors.grey,
            ),
          if (objReview.length != 0) SizedBox(height: 10),
          SectionTitle(title: "People also like"),
          SimilarSection(datas: objSimilar),
        ],
      ),
    );
  }
}
