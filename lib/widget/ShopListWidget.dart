import 'package:flutter/material.dart';

import '../model/ShopModel.dart';
import '../view/ShopDetailPage.dart';
//検索結果で表示する店舗情報を格納するwidget
class ShopContainer extends StatelessWidget {
  const ShopContainer({
    super.key,
    //shopモデルの情報を受け取る
    required this .shop
});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    //コンテナ同士の間に余白をつける
    return Padding(
        padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
    ),
    child: InkWell(
    onTap: () {
    // Shop の詳細画面に遷移する処理を記述
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShopDetailPage(shop: shop)),
    );
    },
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //店名
            Text(
                shop.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),

            //アクセス
            Text(
              shop.access,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            //サムネイル画像
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(shop.logo_image),
                    )
                  ],
                )
              ],
            )
              ]
            )
          )
    );
  }
}
