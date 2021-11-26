import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import './statebloc.dart';


class LocationBloc{
  final _eventController = StreamController<buttonEvent>();
  Stream<buttonEvent> get eventStream => _eventController.stream;
  Sink<buttonEvent> get eventSink => _eventController.sink;


  final _locationController = StreamController<LatLng>();
  Stream<LatLng> get locationStream => _locationController.stream;
  Sink<LatLng> get locationSink => _locationController.sink;


  LatLng _currentLocation = const LatLng(0, 0);

  LocationBloc(){
    eventStream.listen((event) async{ 
      if(event == buttonEvent.navigate){
        Position _currentLocationPos = await GeolocatorPlatform.instance.getCurrentPosition();
        _currentLocation = LatLng(_currentLocationPos.latitude, _currentLocationPos.longitude);
        locationSink.add(_currentLocation);
      }
      else if(event == buttonEvent.exit){
        locationSink.add(const LatLng(100, 100));
      }
    });
  } 
  void dispose(){
    _eventController.close();
    _locationController.close();
  }
}