import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mymovieslist/api/requestApi.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';
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
  }

  // @override
  // Widget build(BuildContext context) {
  //   return obj != null
  //       ? Scaffold(
  //           appBar: AppBar(title: Text(widget.type.toUpperCase())),
  //           body: SingleChildScrollView(
  //             child: Column(
  //               children: <Widget>[
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Container(
  //                       width: 180,
  //                       height: 250,
  //                       child: Card(
  //                         semanticContainer: true,
  //                         clipBehavior: Clip.antiAliasWithSaveLayer,
  //                         child: Center(
  //                           child: CachedNetworkImage(
  //                             imageUrl: imageUrl + obj["poster_path"],
  //                             placeholder: (context, url) => CircularProgressIndicator.adaptive(),
  //                             errorWidget: (context, url, error) => Icon(Icons.error),
  //                             imageBuilder: (context, imageProvider) => Container(
  //                               decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //                                   image: imageProvider,
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(15),
  //                         ),
  //                         elevation: 6,
  //                         margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
  //                       ),
  //                     ),
  //                     Flexible(
  //                       child: Padding(
  //                         padding: const EdgeInsets.only(bottom: 30),
  //                         child: Text(
  //                           obj["name"] != null ? obj["name"] : obj["title"],
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(10),
  //                   child: Column(
  //                     children: <Widget>[
  //                       Row(
  //                         children: [
  //                           Container(
  //                             child: Text(
  //                               obj["name"] != null ? obj["name"] : obj["title"],
  //                               style: TextStyle(
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 10),
  //                       Row(
  //                         children: [
  //                           Container(
  //                             child: Text(
  //                               obj["name"] != null ? obj["name"] : obj["title"],
  //                               style: TextStyle(
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         )
  //       : Scaffold(
  //           appBar: AppBar(),
  //           body: SectionTitle(
  //             myColor: Colors.red,
  //             title: "Loding",
  //           ),
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> getTextFromFile() async {
      var future = [];

      if (widget.type == "movie") {
        future.add(await getMovieDetail(widget.obj["id"]));
        future.add(await getMovieCredit(widget.obj["id"]));
        future.add(await getMovieReview(widget.obj["id"]));
        future.add(await getMovieSimilar(widget.obj["id"]));
      } else {
        future.add(await getTVDetail(widget.obj["id"]));
        future.add(await getTVCredit(widget.obj["id"]));
        future.add(await getTVReview(widget.obj["id"]));
        future.add(await getTVSimilar(widget.obj["id"]));
      }

      return future;
    }

    return new FutureBuilder<List<dynamic>>(
      future: getTextFromFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(snapshot.data?[0]["homepage"]),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
