import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/customWidgets/CustomGenreCard.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({Key? key, required this.genreID, required this.genreName, this.itemCount}) : super(key: key);

  final genreID;
  final itemCount;
  final genreName;

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    super.initState();
    getMovieByGenre(widget.genreID).then((value) {
      setState(() {
        datas = value.take(widget.itemCount ?? 20).toList();
      });
    });
  }

  var datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genreName),
      ),
      body: datas != null
          ? GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 2,
              children: <Widget>[
                for (var i in datas) CustomGenreCard(obj: i),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
