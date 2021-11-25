import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//constants
import 'constants.dart';
//widgets
import './widgets/nav_widget.dart';

class MapsPlugin extends StatelessWidget{
  
  MapsPlugin({Key? key}):super(key:key);
  

  final Set<Polygon> _polygons = HashSet<Polygon>(); //creating set of polygons to pass it to GoogleMap Function!

  void _addPolygon(){  //creates polygon of the lat and lang points from the latlanPoints variable
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
  @override
  Widget build(BuildContext context) {
    _addPolygon();//function call
    return Scaffold(
      body: 
          Stack(
            alignment: Alignment.bottomCenter,
            children:[ GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,initialCameraPosition: 
            cameraPos,
            polygons: _polygons,
            myLocationEnabled:  true,
            ),
            NavWidget(),
            ]
          ),

    );
  }
}