import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/ShopModel.dart';


Future<List<Shop>> searchHotpapper(String keyword) async {
  //URL、クエリパラメータの設定
  final uri = Uri.https('webservice.recruit.co.jp', '/hotpepper/gourmet/v1/', {
    'range': '3',
  });

  //アクセスキーの取得
  final String token = dotenv.env['Hotpapper_API_TOKEN'] ?? '';

  //グルメサーチAPIにリクエストを送る
  final http.Response res = await http.get(uri, headers: {
    'Authorization': 'Bearer $token',
  });

  //戻り値をShopクラスの配列に変換
  //変換したShopクラスの配列を返す(returnする)
  if (res.statusCode == 200) {
    // レスポンスをモデルクラスへ変換
    final List<dynamic> body = jsonDecode(res.body);
    return body.map((dynamic json) => Shop.fromJson(json)).toList();
  } else {
    return [];
  }
}