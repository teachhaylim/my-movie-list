import 'package:flutter/material.dart';
import 'package:mymovieslist/customWidgets/SectionTitle.dart';

class GernicTitle extends StatelessWidget {
  const GernicTitle({Key? key, required this.title}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SectionTitle(title: title),
      )
    ]);
  }
}
