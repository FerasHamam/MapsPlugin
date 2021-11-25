import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      child: const Text("Navigate"),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        onPrimary: Colors.white,
        shadowColor: Colors.grey,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        minimumSize: const Size(120, 50),
      ),
    );
  }
}