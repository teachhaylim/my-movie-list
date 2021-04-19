import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class CustomCard extends StatefulWidget {
  final obj;
  final type;

  const CustomCard({Key? key, required this.obj, required this.type}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  void show() {
    // print(widget.obj);
  }

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
              imageUrl: imageUrl + widget.obj["poster_path"],
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
              child: DetailPage(obj: widget.obj, type: widget.type),
            ),
          )
        },
      ),
    );
  }
}
