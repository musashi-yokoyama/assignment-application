//小分けにして可読性を上げたい
import 'package:flutter/material.dart';

import 'SearchCategoryPage.dart';

class SearchRangePage extends StatefulWidget {
  SearchRangePage({Key? key}) : super(key: key);

  @override
  _SearchRangePageState createState() => _SearchRangePageState();
}

class _SearchRangePageState extends State<SearchRangePage> {
  double _sliderValue = 1.5; // Change initial value to be slightly below half
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_getDistanceText(_sliderValue)}',
              style: TextStyle(fontSize: 45,),
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? Column(
        children: [
          Spacer(),
          SliderWidget(
            value: _sliderValue,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
          ),
          SizedBox(height: 1),
          ElevatedButton(
              onPressed: () {},
              child: Text('検索する'),
              style: ElevatedButton.styleFrom(fixedSize: Size(100, 40))
          ),
        ],
      )
          : SearchCategoryPage(),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
//appbarの距離の変更
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
}

//スライダーボタンのウィジェット
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

//ボトムズナビゲータボタンのウィジェット
class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemTapped;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

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

