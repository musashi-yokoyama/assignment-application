//小分けにして可読性を上げたい
import 'package:flutter/material.dart';

import 'SearchCategoryPage.dart';

import 'package:flutter/material.dart';

import 'SearchCategoryPage.dart';

class SearchRangePage extends StatefulWidget {
  SearchRangePage({Key? key}) : super(key: key);

  @override
  _SearchRangePageState createState() => _SearchRangePageState();
}

class _SearchRangePageState extends State<SearchRangePage> {
  double _sliderValue = 1.5;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Center(
        child: Text(
          '${_getDistanceText(_sliderValue)}',
          style: TextStyle(fontSize: 45,),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return _selectedIndex == 0
        ? _buildSearchByLocation()
        : SearchCategoryPage();
  }

  Widget _buildSearchByLocation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.search,size: 50,),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Colors.orange
            ),
          ),
        ),
        SliderWidget(
          value: _sliderValue,
          onChanged: (newValue) {
            setState(() {
              _sliderValue = newValue;
            });
          },
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
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
      currentIndex: _selectedIndex,
      backgroundColor: Colors.brown,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
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