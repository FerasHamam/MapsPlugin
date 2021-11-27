import 'package:flutter/material.dart';
//BloC
import 'bloc/locationbloc.dart';
//widgets
import './widgets/nav_widget.dart';
import './widgets/map_widget.dart';

class MapsPlugin extends StatefulWidget {
  const MapsPlugin({Key? key}) : super(key: key);
  @override
  State<MapsPlugin> createState() => _MapsPluginState();
}

class _MapsPluginState extends State<MapsPlugin> {
  late LocationBloc _locationBloc;
  @override
  void dispose() {
    _locationBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _locationBloc = LocationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MapWidget(locationBloc: _locationBloc), //first child of the stack
          NavWidget(
            //passing locationBloC to let the buttons control MapWidget!
            locationBloc: _locationBloc,
          ), //second child of the stack
        ],
      ),
    );
  }
}
