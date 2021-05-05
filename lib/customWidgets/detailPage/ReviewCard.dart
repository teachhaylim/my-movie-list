import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard(
      {this.imageUrl = "https://via.placeholder.com/300",
      this.name = "Reviewer Name",
      this.description =
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      this.rating = 0});

  final String imageUrl;
  final String name;
  final String description;
  final double rating;
  final _scrollController = ScrollController();

  checkTextReview(text) {
    if (text.length > 130) {
      return text.toString().substring(0, 125) + "  .....more";
    } else {
      return text;
    }
  }

  checkRating(rate) {
    if (rate >= 0 && rate <= 3) {
      return Colors.red;
    } else if (rate >= 4 && rate <= 7) {
      return Colors.blue;
    } else if (rate >= 8 && rate <= 10) {
      return Colors.greenAccent;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Container(
        height: 220,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              spreadRadius: -10,
              offset: Offset(0, 10), // Shadow position
            ),
          ],
        ),
        child: Card(
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 23,
                              child: CachedNetworkImage(
                                imageUrl: imageUrl,
                                placeholder: (context, url) => CircularProgressIndicator.adaptive(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  name,
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
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          rating % 2 == 0 ? rating.toStringAsFixed(0) + " / 10" : rating.toStringAsFixed(1) + " / 10",
                          style: TextStyle(
                            color: checkRating(rating),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: RawScrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    thumbColor: primaryLight,
                    radius: Radius.circular(20),
                    thickness: 5,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      child: Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
