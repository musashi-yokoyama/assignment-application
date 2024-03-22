import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/ShopModel.dart';

//5つのクエリパラメータを設定しなければいけない？
Future<List<Shop>> searchHotpapper(String keyword, double lat, double lon, int range) async {
  //URL、クエリパラメータの設定
  final uri = Uri.https('webservice.recruit.co.jp', '/hotpepper/gourmet/v1/', {
    'lat': lat.toString(),
    'lng': lon.toString(),
    'range': range.toString(),
  });

  //アクセスキーの取得
  final String token = dotenv.env['Hotpapper_API_TOKEN'] ?? '';

  //グルメサーチAPIにリクエストを送る
  final http.Response res = await http.get(uri, headers: {
    'Authorization': 'Bearer $token',
  });
  //レスポンスのハンドリング
  if (res.statusCode == 200) {
    // レスポンスをモデルクラスへ変換
    final Map<String, dynamic> data = jsonDecode(res.body);
    if (data.containsKey('results') && data['results'].containsKey('shop')) {
      final List<dynamic> body = data['results']['shop'];
      return body.map((dynamic json) => Shop.fromJson(json)).toList();
    } else {
      throw Exception('店舗が見つかりませんでした');
    }
  } else {
    throw Exception('失敗しました: ${res.statusCode}');
  }
}