import 'package:flutter/material.dart';
//BloC
import 'package:maps_plugin/bloc/locationbloc.dart';
import 'package:maps_plugin/bloc/statebloc.dart';
class NavigateButton extends StatelessWidget {
  final LocationBloc locationBloc;
  const NavigateButton({
    Key? key,
    required  this.locationBloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SharedButton(text: 'Exit',event: buttonEvent.exit,locationBloc: locationBloc,),
        SharedButton(text: 'Navigate',event: buttonEvent.pressed,locationBloc: locationBloc,),
      ],
    );
  }
}

class SharedButton extends StatelessWidget {
  final buttonEvent event;
  final String text;
  final LocationBloc locationBloc;
  const SharedButton({
    Key? key,
    required this.event,
    required this.locationBloc,
    required this.text
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: (){
          locationBloc.eventSink.add(event);
        }, 
        child:  Text(text),
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