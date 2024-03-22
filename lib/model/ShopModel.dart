//機能最低条件
//・店舗名称,アクセス,サムネイル画像
//・店舗名称,住所,営業時間,画像

//アプリケーションに使いやすいようにデータを整形
class Shop {
  //コンストラクタ
  Shop({
    required this.name,
    required this.address,
    required this.station_name,
    required this.access,
    required this.open,
    required this.logo_image,
    required this.lat,
    required this.lng,
  });
  //プロパティ
  final String name;
  final String address;
  final String station_name;
  final String access;
  final String open;
  final String logo_image;
  final String lat;
  final String lng;

  // JSONからArticleを生成するファクトリコンストラクタ
  factory Shop.fromJson(dynamic json) {
    return Shop(
      name: json['name'] as String,
      address: json['address'] as String,
      station_name: json['station_name'] as String,
      access: json['access'] as String,
      open: json['open'] as String,
      logo_image: json['logo_image'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
}