import 'dart:async';
import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPlugin {
  static const MethodChannel _channel = MethodChannel('maps_plugin');

  static List<LatLng>latlanPoints = [ //lat and lan points aroung sheikh khalil in irbid
    const LatLng(32.55100147019295, 35.85993737957684),
    const LatLng(32.55465573962508, 35.85020687037383),
    const LatLng(32.54097176632944, 35.8511702871266),
    const LatLng(32.542311832099735, 35.85916664617462)
  ];

  static Set<Polygon> _polygons = HashSet<Polygon>(); //creating set of polygons to pass it to GoogleMap Function!

  static const CameraPosition _cameraPos =  CameraPosition( //Starting position of camera in the map
    target:  LatLng(32.54833631851169, 35.858889312939816),//sheikh khalil in irbid
    zoom:  16,
  );

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static _addPolygon(){  //creates polygon of the lat and lang points from the latlanPoints variable
    _polygons.add(
      Polygon(
        polygonId: const PolygonId("polygon 1"),
        points: latlanPoints,
        strokeColor: Colors.pink,
        strokeWidth: 2,
        fillColor: Colors.pink.withOpacity(0.15),
      ),
    );
  }
  static GoogleMap getMap(){  //returns map with polygon in the desired location!
    _addPolygon();
    return  GoogleMap(
    mapType: MapType.hybrid,initialCameraPosition: 
    _cameraPos,
    polygons: _polygons,
    myLocationEnabled:  true,
    );
  }
}