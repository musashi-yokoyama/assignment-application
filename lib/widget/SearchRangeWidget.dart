import 'package:flutter/material.dart';
//範囲検索のwidgetをコンポーネント化

//下のナビゲーションバー
class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '周囲で探す',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'カテゴリで探す',
        ),
      ],
      currentIndex: selectedIndex,
      backgroundColor: Colors.brown,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}


//ここから下は検索範囲を指定するwidget群
String _getDistanceText(double value) {
  switch (value.toInt()) {
    case 0:
      return '300m';
    case 1:
      return '500m';
    case 2:
      return '1km';
    case 3:
      return '2km';
    case 4:
      return '3km';
    default:
      return '';
  }
}

class SliderWidget extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;

  const SliderWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (onChanged != null) {
          onChanged!(value + details.primaryDelta! / 100);
        }
      },
      child: Slider(
        value: value,
        onChanged: onChanged,
        min: 0,
        max: 4,
        divisions: 4,
      ),
    );
  }
}

class SliderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double sliderValue;

  SliderAppBar({required this.sliderValue});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          '${_getDistanceText(sliderValue)}',
          style: TextStyle(fontSize: 45,),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}