import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Positioned(
      right: deviceSize.width * 0.8,
      bottom: deviceSize.height * 0.8,
      child: ElevatedButton(
        child: const Text(
          'EN',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            elevation: 3,
            primary: Colors.black,
            onPrimary: Colors.grey,
            minimumSize: const Size(50, 50)),
        onPressed: () {},
      ),
    );
  }
}
