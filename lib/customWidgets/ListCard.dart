import 'package:flutter/material.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/customWidgets/CustomCard.dart';

class ListCards extends StatefulWidget {
  final String? uri;
  final String? type;

  const ListCards({Key? key, required this.uri, required this.type}) : super(key: key);

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
      height: 250,
      child: datas != null
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in datas)
                    CustomCard(
                      obj: i,
                      type: widget.type,
                    ),
                ],
              ))
          : Center(child: CircularProgressIndicator()),
    );
  }
}
