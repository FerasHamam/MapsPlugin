import 'package:flutter/material.dart';
//BloC
import 'package:maps_plugin/bloc/locationbloc.dart';
import 'package:maps_plugin/bloc/button_event.dart';

class NavigateButtons extends StatelessWidget {
  final LocationBloc locationBloc; //location BloC from maps_plugin.dart
  const NavigateButtons({
    Key? key,
    required this.locationBloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          locationBloc.eventSink.add(buttonEvent.navigate);
        },
        child: const Text('Navigate'),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          shadowColor: Colors.grey,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          minimumSize: const Size(100, 50),
        ),
      ),
    );
  }
}
