import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovieslist/api/myAPI.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class CustomCategory extends StatefulWidget {
  // const CustomCategory({Key? key, required this.url, this.itemCount}) : super(key: key);

  // final String url;
  // final itemCount;

  @override
  _CustomCategoryState createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  // @override
  // void initState() {
  //   super.initState();
  //   getGenre(widget.url).then((value) {
  //     setState(() {
  //       datas = value.take(widget.itemCount ?? 10).toList();
  //     });
  //   });
  // }

  // var datas;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 4,
        children: <Widget>[
          for (var i in genres.take(8).toList())
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey.shade800,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      child: SvgPicture.asset(i["icon"], color: i["color"]),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          i["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
