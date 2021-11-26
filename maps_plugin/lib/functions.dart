import 'package:flutter/material.dart';
import './maps_plugin.dart';
//map
import 'package:google_maps_flutter/google_maps_flutter.dart';
//constants
import 'constants.dart';

void addPolygon(){  //creates polygon of the lat and lang points from the latlanPoints variable
    MapsPlugin.polygons.add(
      Polygon(
        polygonId: const PolygonId("polygon 1"),
        points: latlanPoints,
        strokeColor: Colors.pink,
        strokeWidth: 2,
        fillColor: Colors.pink.withOpacity(0.15),
      ),
    );
  }
void addPolyline(LatLng userLocationPoint){  //creates polygon of the lat and lang points from the latlanPoints variable
  MapsPlugin.polylines.add(
    Polyline(
      polylineId: const PolylineId("polyline 1"),
      points: [userLocationPoint,latlanPoints[0]],
      jointType: JointType.round,
      width: 2
    ),
  );
}