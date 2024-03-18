import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/ShopModel.dart';

/*
String型の引数を受け取る
http通信に必要なデータを準備する
URL、クエリパラメータの設定
アクセスキーの取得
引数を含めてグルメサーチAPIを呼び出す
APIの戻り値をArticleクラスの配列に変換
変換した値を戻り値として返す
*/

Future<List<Shop>> searchHotpapper(String keyword) async {
  final uri = Uri.https('webservice.recruit.co.jp', '/hotpepper/gourmet/v1/', {
    'range': '3',
  });

  final String token = dotenv.env['Hotpapper_API_TOKEN'] ?? '';

  final http.Response res = await http.get(uri, headers: {
    'Authorization': 'Bearer $token',
  });

  if (res.statusCode == 200) {
    final List<dynamic> body = jsonDecode(res.body);
    return body.map((dynamic json) => Shop.fromJson(json)).toList();
  } else {
    return [];
  }
}