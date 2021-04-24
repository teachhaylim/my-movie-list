import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({Key? key, required this.url, required this.type, this.itemCount}) : super(key: key);

  final String url;
  final type;
  final itemCount;

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  @override
  void initState() {
    super.initState();
    getData(widget.url).then((value) {
      setState(() {
        datas = value.take(widget.itemCount ?? 10).toList();
      });
    });
  }

  var datas;
  var placeholderImage = [
    {"backdrop_path": "/wwemzKWzjKYJFfCeiB57q3r4Bcm.png", "title": "PlaceHolder"},
    {"backdrop_path": "/wwemzKWzjKYJFfCeiB57q3r4Bcm.png", "title": "PlaceHolder"},
    {"backdrop_path": "/wwemzKWzjKYJFfCeiB57q3r4Bcm.png", "title": "PlaceHolder"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          viewportFraction: 0.8,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 8),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.easeInOut,
        ),
        items: datas != null
            ? datas.map<Widget>((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GenericCard(obj: i, type: widget.type);
                  },
                );
              }).toList()
            : placeholderImage.map<Widget>((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GenericCard(obj: i, type: widget.type);
                  },
                );
              }).toList(),
      ),
    );
  }
}

class GenericCard extends StatefulWidget {
  const GenericCard({Key? key, required this.obj, required this.type}) : super(key: key);

  final obj;
  final type;

  @override
  _GenericCardState createState() => _GenericCardState();
}

class _GenericCardState extends State<GenericCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrl + widget.obj["backdrop_path"],
                  placeholder: (context, url) => CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.softLight),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text(
                widget.obj["title"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
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
    );
  }
}
