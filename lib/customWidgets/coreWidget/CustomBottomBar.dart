import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:mymovieslist/utils/appConfig.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key, required this.selectedIndex, required this.onTap}) : super(key: key);

  void Function(int) onTap;
  int selectedIndex;

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)));
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  SnakeShape snakeShape = SnakeShape.rectangle;
  EdgeInsets padding = const EdgeInsets.all(0);
  bool showSelectedLabels = true;
  bool showUnselectedLabels = false;
  Gradient selectedGradient = LinearGradient(colors: [accentColor, primaryDark]);
  Gradient unselectedGradient = LinearGradient(colors: [Colors.white, Colors.white]);

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.gradient(
      behaviour: snakeBarStyle,
      snakeShape: snakeShape,
      shape: bottomBarShape,
      padding: padding,
      snakeViewGradient: selectedGradient,
      selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
      unselectedItemGradient: unselectedGradient,
      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,
      currentIndex: widget.selectedIndex,
      onTap: (index) => {widget.onTap(index)},
      items: [
        BottomNavigationBarItem(icon: widget.selectedIndex == 0 ? new Icon(Icons.home_outlined) : new Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: widget.selectedIndex == 1 ? new Icon(Icons.search) : new Icon(Icons.search), label: 'Search'),
        // BottomNavigationBarItem(icon: widget.selectedIndex == 2 ? new Icon(Icons.live_tv) : new Icon(Icons.tv), label: 'Tv Show'),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
    );
  }
}
