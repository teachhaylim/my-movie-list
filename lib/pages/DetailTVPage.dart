import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';
import 'package:mymovieslist/customWidgets/StarRating.dart';
import 'package:mymovieslist/customWidgets/detailPage/CastAvatar.dart';
import 'package:mymovieslist/customWidgets/detailPage/FormText.dart';
import 'package:mymovieslist/customWidgets/detailPage/ReviewCard.dart';
import 'package:mymovieslist/customWidgets/detailPage/SimilarCard.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class DetailTVPage extends StatefulWidget {
  final objID;
  final type;

  const DetailTVPage({Key? key, required this.objID, required this.type}) : super(key: key);

  @override
  _DetailTVPageState createState() => _DetailTVPageState();
}

class _DetailTVPageState extends State<DetailTVPage> {
  @override
  void initState() {
    super.initState();

    getTVDetail(widget.objID).then((value) {
      print(value["id"]);

      setState(() {
        objDetail = value;
      });
    });

    getTVCredit(widget.objID).then((value) {
      setState(() {
        objCredit = value;
      });
    });

    getTVReview(widget.objID).then((value) {
      setState(() {
        objReview = value;
      });
    });

    getTVSimilar(widget.objID).then((value) {
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.type.toString().toUpperCase()),
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
                subtype: widget.type,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, required this.size, required this.objDetail, required this.objCredit, required this.objReview, required this.objSimilar, required this.subtype}) : super(key: key);

  final Size size;
  final objDetail;
  final objCredit;
  final objReview;
  final objSimilar;
  final subtype;

  bool checkUrl(str) {
    return str.contains("https://");
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
                            child: Text(objDetail["name"], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(objDetail["first_air_date"] + " - " + objDetail["last_air_date"], style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
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
                if (getArr(objCredit["crew"], "known_for_department", "Directing", "name") != "" || getArr(objCredit["crew"], "known_for_department", "Writing", "name") != "")
                  FormText(label: "Director", value: getArr(objCredit["crew"], "known_for_department", "Directing", "name") != "" ? getArr(objCredit["crew"], "known_for_department", "Directing", "name") : getArr(objCredit["crew"], "known_for_department", "Writing", "name")),
                if (objDetail["genres"].length != 0) FormText(label: "Genre", value: getValue(objDetail["genres"], "name")),
                if (objDetail["production_companies"].length != 0) FormText(label: "Studio", value: getValue(objDetail["production_companies"], "name")),
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
                      imageUrl: i["author_details"]["avatar_path"] != null
                          ? checkUrl(i["author_details"]["avatar_path"])
                              ? i["author_details"]["avatar_path"].substring(1, i["author_details"]["avatar_path"].length)
                              : imageUrl + i["author_details"]["avatar_path"]
                          : blankProfile,
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
          if (objSimilar.length != 0) SectionTitle(title: "People also like"),
          if (objSimilar.length != 0) SimilarSection(datas: objSimilar, type: subtype),
        ],
      ),
    );
  }
}
