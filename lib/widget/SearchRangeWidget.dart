import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double sliderValue;

  CustomAppBar({required this.sliderValue});

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

String _getDistanceText(double value) {
  switch (value.toInt()) {
    case 0:
      return '300m';
    case 1:
      return '500m';
    case 2:
      return '1000m';
    case 3:
      return '2000m';
    case 4:
      return '3000m';
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