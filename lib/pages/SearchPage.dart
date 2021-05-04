import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/pages/DetailPage.dart';
import 'package:mymovieslist/utils/appConfig.dart';
import 'package:page_transition/page_transition.dart';

class SearchPage extends SearchDelegate<String> {
  myTap(context, id) {
    print(id);
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.center,
        child: DetailPage(objID: id),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: query.isNotEmpty ? searchMovie(query) : getData(popularUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final result = snapshot.data;

          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.movie),
              title: Text(result[index]["title"].toString()),
              onTap: () {
                myTap(context, result[index]["id"].toString());
              },
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getData(popularUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final result = snapshot.data;

          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.movie),
              title: Text(result[index]["title"].toString()),
              onTap: () {
                myTap(context, result[index]["id"].toString());
              },
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
