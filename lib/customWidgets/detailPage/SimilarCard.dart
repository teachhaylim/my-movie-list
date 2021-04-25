import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class SimilarSection extends StatelessWidget {
  SimilarSection({this.datas, this.type = ""});

  final datas;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var i in datas)
              SimilarCard(
                data: i,
                subtype: type,
              ),
          ],
        ),
      ),
    );
  }
}

class SimilarCard extends StatelessWidget {
  SimilarCard({this.data, this.subtype = ""});

  final data;
  final String subtype;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 250,
      child: GestureDetector(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl + data["poster_path"],
              placeholder: (context, url) => CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        ),
        onTap: () => {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              alignment: Alignment.center,
              child: DetailPage(objID: data["id"], type: subtype),
            ),
          )
        },
      ),
    );
  }
}
