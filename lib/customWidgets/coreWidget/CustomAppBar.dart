import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return new PreferredSize(
      child: new Container(
        padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            appName,
            style: GoogleFonts.fredokaOne(textStyle: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 3)),
          ),
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [accentColor, primaryDark],
          ),
        ),
      ),
      preferredSize: new Size(MediaQuery.of(context).size.width, 150),
    );
  }
}
