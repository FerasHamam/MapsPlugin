import 'dart:async';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPlugin {
  static const MethodChannel _channel = MethodChannel('maps_plugin');
  static const CameraPosition _kGooglePlex =  CameraPosition(
    target:  LatLng(32.54833631851169, 35.858889312939816),
    zoom:  25,
  );
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static GoogleMap getMap(){
    return const GoogleMap(mapType: MapType.hybrid,initialCameraPosition: 
    _kGooglePlex,);
  }
}
//32.54833631851169, 35.858889312939816
