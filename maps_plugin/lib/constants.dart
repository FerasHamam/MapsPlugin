import 'package:google_maps_flutter/google_maps_flutter.dart';

const List<LatLng> latlanPoints = [ //lat and lan points aroung sheikh khalil in irbid
    LatLng(32.55100147019295, 35.85993737957684),
    LatLng(32.55465573962508, 35.85020687037383),
    LatLng(32.54097176632944, 35.8511702871266),
    LatLng(32.542311832099735, 35.85916664617462)
  ];

const CameraPosition cameraPos =   CameraPosition( //Starting position of camera in the map
    target:  LatLng(32.54833631851169, 35.858889312939816),//sheikh khalil in irbid
    zoom:  15,
  );