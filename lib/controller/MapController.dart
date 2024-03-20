//googlemap for flutter
//サンプルコード
//一旦中心を三宮駅にしておく

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWithMarker extends StatelessWidget {
  final LatLng center;

  const MapWithMarker({Key? key, required this.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('center_marker'),
            position: center,
            infoWindow: InfoWindow(title: '三宮駅'),
          ),
        },
      ),
    );
  }
}