import 'package:flutter/material.dart';
//widgets
import 'buttons/arrow_back_button.dart';
import 'buttons/navigate_exit_buttons.dart';
//BloC
import '../bloc/locationbloc.dart';

//this is the nav bar in the bottom of the screen
class NavWidget extends StatelessWidget {
  final LocationBloc locationBloc; //location BloC from maps_plugin.dart
  const NavWidget({Key? key, required this.locationBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.5,
      width: deviceSize.width,
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ArrowBackButton(),
          NavigateButtons(
            //passing locationBloC to let the buttons control this widget!
            locationBloc: locationBloc,
          ),
        ],
      ),
    );
  }
}
