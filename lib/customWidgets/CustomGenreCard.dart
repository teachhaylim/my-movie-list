import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class CustomGenreCard extends StatelessWidget {
  const CustomGenreCard({Key? key, required this.obj}) : super(key: key);

  final obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 300,
      child: GestureDetector(
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
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover, alignment: Alignment.topCenter,),
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
              child: DetailPage(objID: obj["id"]),
            ),
          )
        },
      ),
    );
  }
}
