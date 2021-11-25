import 'dart:collection';
import 'package:flutter/material.dart';
//BloC
import 'bloc/locationbloc.dart';
//location and map
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//constants
import 'constants.dart';
//widgets
import './widgets/nav_widget.dart';

class MapsPlugin extends StatefulWidget{
  const MapsPlugin({Key? key}):super(key:key);
  static Set<Polygon> polygons = HashSet<Polygon>(); //creating set of polygons to pass it to GoogleMap Function!
  static Set<Polyline> polylines = HashSet<Polyline>();//creating set of polylines to pass it to GoogleMap Function!
  // static late Position currentPosition;
  @override
  State<MapsPlugin> createState() => _MapsPluginState();
}

class _MapsPluginState extends State<MapsPlugin> {
  final LocationBloc _locationBloc = LocationBloc();
  late GoogleMapController _controller; 
  @override
  void dispose() {
    _locationBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _addPolygon();
    return 
       Scaffold(
        body: 
            Stack(
              alignment: Alignment.bottomCenter,
              children:[ StreamBuilder<LatLng>(
                stream: _locationBloc.locationStream,
                initialData: const LatLng(0,0),
                builder:(context,snapShot){
                  if(snapShot.connectionState != ConnectionState.waiting){
                    _addPolyline(snapShot.data!); 
                    if(snapShot.data!.latitude > 90 || snapShot.data!.longitude > 90 || snapShot.data!.latitude < -90 ||snapShot.data!.longitude < -90 )
                    {
                      MapsPlugin.polylines.clear();
                    }
                    else{
                      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: snapShot.data!,zoom: 15)));
                    }
                  }
                  return GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.hybrid,
                    initialCameraPosition: cameraPos,
                    polygons: MapsPlugin.polygons,
                    myLocationEnabled:  true,
                    polylines: MapsPlugin.polylines,
                    onMapCreated: (GoogleMapController controller){
                      _controller = controller;
                    },
                    );
                }
              ),
              NavWidget(
                locationBloc: _locationBloc,
              ),
              ]
            ),
    );
  }
}

void _addPolygon(){  //creates polygon of the lat and lang points from the latlanPoints variable
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
void _addPolyline(LatLng point){  //creates polygon of the lat and lang points from the latlanPoints variable
  MapsPlugin.polylines.add(
    Polyline(
      polylineId: const PolylineId("polyline 1"),
      points: [point,latlanPoints[0]],
      jointType: JointType.round,
      width: 2
    ),
  );
}