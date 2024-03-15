class RestaurantDataModel {
  final Results results;

  RestaurantDataModel({required this.results});

  factory RestaurantDataModel.fromJson(Map<String, dynamic> json) {
    return RestaurantDataModel(
      results: Results.fromJson(json['results']),
    );
  }
}

class Results {
  final List<Shop> shop;

  Results({required this.shop});

  factory Results.fromJson(Map<String, dynamic> json) {
    var list = json['shop'] as List;
    List<Shop> shopList = list.map((i) => Shop.fromJson(i)).toList();

    return Results(shop: shopList);
  }
}

//必要そうな機能だけ取る
class Shop {
  final String name;
  final Genre genre;
  final Photo photo;
  final String address;
  final String close;
  final String open;
  final String shopCatch;
  final String stationName;

  Shop({
    required this.name,
    required this.genre,
    required this.photo,
    required this.address,
    required this.close,
    required this.open,
    required this.shopCatch,
    required this.stationName,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      name: json['name'],
      genre: Genre.fromJson(json['genre']),
      photo: Photo.fromJson(json['photo']),
      address: json['address'],
      close: json['close'],
      open: json['open'],
      shopCatch: json['catch'],
      stationName: json['station_name'],
    );
  }
}

class Genre {
  final String name;
  final String genreCatch;

  Genre({required this.name, required this.genreCatch});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      name: json['name'],
      genreCatch: json['catch'],
    );
  }
}

class Photo {
  final Mobile mobile;

  Photo({required this.mobile});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      mobile: Mobile.fromJson(json['mobile']),
    );
  }
}

class Mobile {
  final String l;

  Mobile({required this.l});

  factory Mobile.fromJson(Map<String, dynamic> json) {
    return Mobile(
      l: json['l'],
    );
  }
}

class Urls {
  final String pc;

  Urls({required this.pc});

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      pc: json['pc'],
    );
  }
}

enum MenuRangeType {
  range1,
  range2,
  range3,
  range4,
  range5,
}

extension MenuRangeTypeExtension on MenuRangeType {
  String get range {
    switch (this) {
      case MenuRangeType.range1:
        return "300m";
      case MenuRangeType.range2:
        return "500m";
      case MenuRangeType.range3:
        return "1,000m";
      case MenuRangeType.range4:
        return "2,000m";
      case MenuRangeType.range5:
        return "3,000m";
    }
  }

  String get rangeValue {
    switch (this) {
      case MenuRangeType.range1:
        return "1";
      case MenuRangeType.range2:
        return "2";
      case MenuRangeType.range3:
        return "3";
      case MenuRangeType.range4:
        return "4";
      case MenuRangeType.range5:
        return "5";
    }
  }
}