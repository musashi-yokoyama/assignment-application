import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/shop_model.dart';

final String? token = dotenv.env['Hotpapper_ACCESS_Key'];

class APIClient {
  static Future<RestaurantDataModel> fetchRestaurantData(
      {String? keyword, required String range, String? genre}) async {
    final apiURL = createAPIRequestURL(keyword: keyword, range: range, genre: genre);

    if (apiURL == null) {
      throw Exception('通信に失敗しました');
    }

    final response = await http.get(apiURL);

    if (response.statusCode != 200) {
      throw Exception('データの取得に失敗しました: ${response.statusCode}');
    }

    final decodedData = jsonDecode(response.body);
    return RestaurantDataModel.fromJson(decodedData);
  }

  static Uri? createAPIRequestURL({String? keyword, required String range, String? genre}) {
    final baseURL = Uri.parse('https://webservice.recruit.co.jp/hotpepper/gourmet/v1');
    final apikey = dotenv.env['Hotpapper_API_KEY'];
    const format = 'json';
    final queryParameters = {
      'key': dotenv.env['Hotpapper_API_Key'],
      'lat': '34.693849',
      'lng': '135.196045 ',//三ノ宮駅
      'format': format,
      'count': '20',
      'range': range,
    };

    if (keyword != null) {
      queryParameters['keyword'] = keyword;
    }

    if (genre != null) {
      queryParameters['genre'] = genre;
    }

    return baseURL.replace(queryParameters: queryParameters);
  }
}

/*
void main() async {
  try {
    final restaurantData = await APIClient.fetchRestaurantData(
        keyword: 'ramen',
        range: '3',
        genre: 'G001'
    );
    print('Restaurant data: $restaurantData');
  } catch (e) {
    print('Error fetching restaurant data: $e');
  }
}
*/
