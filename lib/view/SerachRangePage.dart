//コンポーネント化して可読性を上げたい
//地図の表記は諦める

import 'package:flutter/material.dart';

import '../widget/SearchRangeWidget.dart';
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
      appBar: CustomAppBar(
        sliderValue: _sliderValue,
      ),
      body: _selectedIndex == 0
          ? _buildSearchByLocation()
          : SearchCategoryPage(),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildSearchByLocation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.search, size: 50,),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.orange,
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
}
