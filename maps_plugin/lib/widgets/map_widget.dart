import 'dart:collection';
import 'package:flutter/material.dart';
//maps
import 'package:google_maps_flutter/google_maps_flutter.dart';
//bloc
import 'package:maps_plugin/bloc/locationbloc.dart';
//constants
import '../constants.dart';
//functions
import '../functions.dart';

// ignore: must_be_immutable
class MapWidget extends StatelessWidget {
  //creating set of polygons to pass it to GoogleMap Function!
  static Set<Polygon> polygons = HashSet<Polygon>();
  //creating set of polylines to pass it to GoogleMap Function!
  static Set<Polyline> polylines = HashSet<Polyline>();

  late GoogleMapController _controller; //map controller to animate camera

  final LocationBloc locationBloc; //location BloC from maps_plugin.dart

  MapWidget({required this.locationBloc, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    addPolygon(); //function from functions.dart file
    return StreamBuilder<LatLng>(
        //stream to detect the pressed buttons on the nav bar
        stream: locationBloc.locationStream,
        initialData: latlanPoints[0], //any dummy point to start with
        builder: (context, snapShot) {
          //won't enter first time because connection state will be waiting
          if (snapShot.connectionState == ConnectionState.active) {
            addPolyline(snapShot.data!); //function from functions.dart file
            _controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: snapShot.data!, zoom: 15),
              ),
            );
          }
          return GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: cameraPos,
            polygons: polygons,
            myLocationEnabled: true,
            polylines: polylines,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          );
        });
  }
}
