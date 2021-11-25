import 'package:flutter/material.dart';
import 'package:maps_plugin/maps_plugin.dart';
class MapsScreen extends StatelessWidget {
  const MapsScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map"),centerTitle: true,
      leading: IconButton(
      icon: const Icon(Icons.arrow_back_rounded,),
      onPressed: ()=>Navigator.of(context).pop(),
        ),
      ),
      body: MapsPlugin.getMap(),
    );
  }
}