import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPlugin extends StatelessWidget{
  
  MapsPlugin({Key? key}):super(key:key);
  final List<LatLng>latlanPoints = [ //lat and lan points aroung sheikh khalil in irbid
    const LatLng(32.55100147019295, 35.85993737957684),
    const LatLng(32.55465573962508, 35.85020687037383),
    const LatLng(32.54097176632944, 35.8511702871266),
    const LatLng(32.542311832099735, 35.85916664617462)
  ];

  final CameraPosition _cameraPos =  const CameraPosition( //Starting position of camera in the map
    target:  LatLng(32.54833631851169, 35.858889312939816),//sheikh khalil in irbid
    zoom:  16,
  );

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
    final Size deviceSize = MediaQuery.of(context).size;
    _addPolygon();//function call
    return Scaffold(
      body: 
          Stack(
            alignment: Alignment.bottomCenter,
            children:[ GoogleMap(
              zoomControlsEnabled: false,
              
            mapType: MapType.hybrid,initialCameraPosition: 
            _cameraPos,
            polygons: _polygons,

            myLocationEnabled:  true,
            ),
            Container(
              height: deviceSize.height*0.07,
              width: deviceSize.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_rounded,color: Colors.black,size: 32,),),
                  ElevatedButton(onPressed: (){}, child: const Text("Navigate"),style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              shadowColor: Colors.grey,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: const Size(120, 50), //////// HERE
            ),)
                ],
              ),
            ),
            ]
          ),

    );
  }
}