import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


//位置を取得して経度と緯度の情報を更新する
class LocationModel {
  double? latitude;
  double? longitude;

  Future<void> updateLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      //実験
      print(e.toString());
    }
  }
}

//位置情報を取得し、緯度と経度を返し
Future searchLocation()async{
  final position = await _determinePosition();
  final latitude = position.latitude;
  final longitude = position.longitude;
}

//位置情報を取得する許可を取る
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('位置情報の設定がoffになっています');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('位置情報の許可が拒否されています');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        '位置情報の許可は永久に拒否されています');
  }
  return await Geolocator.getCurrentPosition();
}
