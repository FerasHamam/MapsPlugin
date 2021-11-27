import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
//events
import 'button_event.dart';

class LocationBloc {
  final _eventController = StreamController<buttonEvent>();
  Stream<buttonEvent> get eventStream => _eventController.stream;
  Sink<buttonEvent> get eventSink => _eventController.sink;

  final _locationController = StreamController<LatLng>();
  Stream<LatLng> get locationStream => _locationController.stream;
  Sink<LatLng> get locationSink => _locationController.sink;

  LatLng _currentLocation = const LatLng(0, 0);

  LocationBloc() {
    _currentLocation = const LatLng(100, 100);
    eventStream.listen((event) async {
      if (event == buttonEvent.navigate) {
        Position _currentLocationPos =
            await GeolocatorPlatform.instance.getCurrentPosition();
        _currentLocation =
            LatLng(_currentLocationPos.latitude, _currentLocationPos.longitude);
        if (_eventController.hasListener == true) {
          locationSink.add(_currentLocation);
        }
      }
    });
  }
  void dispose() async {
    _locationController.close();
    _eventController.close();
  }
}
