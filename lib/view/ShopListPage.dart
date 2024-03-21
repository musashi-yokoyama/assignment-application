import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/ShopModel.dart';
import '../widget/SearchRangeWidget.dart';
import '../widget/ShopListWidget.dart';

class ShopListPage extends StatefulWidget {
  const ShopListPage({Key? key}) : super(key: key);

  @override
  State<ShopListPage> createState() => _ShopListPage();
}

class _ShopListPage extends State<ShopListPage> {
  List<Map<String, dynamic>> shop = [];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索結果'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            //Listviewでスクロール可能なリストにする
            child: ListView(
              /*
              children: shop
                  .map((shop) => ShopContainer(shop: shop))
                  .toList(),

               */
            ),
          ),
        ],
      ),
    );
  }
}