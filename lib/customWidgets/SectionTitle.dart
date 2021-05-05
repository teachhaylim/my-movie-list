import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, this.title, this.myColor}) : super(key: key);

  final title;
  final Color? myColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Text(
        title,
        style: GoogleFonts.robotoSlab(
          textStyle: TextStyle(
            color: myColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
