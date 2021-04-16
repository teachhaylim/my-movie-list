import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class CustomCard extends StatefulWidget {
  final data;

  const CustomCard({Key? key, required this.data}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  void show() {
    print(widget.data);
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
          child: CachedNetworkImage(
            imageUrl: imageUrl + widget.data["poster_path"],
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        ),
        onTap: () => show(),
      ),
    );
  }
}
