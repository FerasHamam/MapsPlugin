import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(), 
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.black,
        size: 32,
      ),
    );
  }
}
