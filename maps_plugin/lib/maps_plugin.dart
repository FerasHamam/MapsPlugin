import 'dart:collection';
import 'package:flutter/material.dart';
//BloC
import 'bloc/locationbloc.dart';
//location and map
import 'package:google_maps_flutter/google_maps_flutter.dart';
//constants
import 'constants.dart';
//widgets
import './widgets/nav_widget.dart';
//functions
import './functions.dart';

class MapsPlugin extends StatefulWidget{
  const MapsPlugin({Key? key}):super(key:key);
  static Set<Polygon> polygons = HashSet<Polygon>(); //creating set of polygons to pass it to GoogleMap Function!
  static Set<Polyline> polylines = HashSet<Polyline>();//creating set of polylines to pass it to GoogleMap Function!
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
    addPolygon();//function from functions.dart file
    return 
       Scaffold(
        body: 
            Stack(
              alignment: Alignment.bottomCenter,
              children:[ 
                StreamBuilder<LatLng>(//first child of the stack
                stream: _locationBloc.locationStream,//stream to detect the pressed buttons on the nav bar
                initialData: latlanPoints[0],//any dummy point to start with
                builder:(context,snapShot){
                  if(snapShot.connectionState == ConnectionState.active){//won't enter first time because connection state will be waiting
                    if(snapShot.data!.latitude > 90 || snapShot.data!.longitude > 90 || snapShot.data!.latitude < -90 ||snapShot.data!.longitude < -90 )
                    {
                      MapsPlugin.polylines.clear();
                      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latlanPoints[0],zoom: 15)));
                    }
                    else{
                      addPolyline(snapShot.data!);//function from functions.dart file
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
              NavWidget(//second child of the stack
                locationBloc: _locationBloc,//passing locationBloC to let the buttons control this widget!
              ),
              ]
            ),
    );
  }
}