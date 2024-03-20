import 'package:flutter/material.dart';
//検索結果で表示する店舗情報を格納したwidget
class ShopContainer extends StatelessWidget {
  const ShopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    );
  }
}
