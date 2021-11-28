import 'package:flutter/material.dart';
import 'package:maps_plugin/maps_plugin.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Navigate to'),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          shadowColor: Colors.grey,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          minimumSize: const Size(120, 60),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapsPlugin()),
          );
        },
      ),
    );
  }
}
