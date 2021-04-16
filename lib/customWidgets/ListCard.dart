import 'package:flutter/material.dart';
import 'package:mymovieslist/api/requestApi.dart';
import 'package:mymovieslist/customWidgets/CustomCard.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';

class ListCards extends StatefulWidget {
  final String? uri;

  const ListCards(this.uri);

  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  @override
  void initState() {
    super.initState();
    getData(widget.uri).then((value) {
      setState(() {
        datas = value;
      });
    });
  }

  var datas;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: datas != null
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in datas) CustomCard(data: i),
                ],
              ))
          : SectionTitle(title: "Loading", myColor: Colors.red),
    );
  }
}
