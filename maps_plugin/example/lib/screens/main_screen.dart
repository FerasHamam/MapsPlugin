import 'package:flutter/material.dart';
//buttons
import '../buttons/language_button.dart';
import '../buttons/navigate_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      height: deviceSize.height,
      width: double.infinity,
      child: Stack(
        children: const [LanguageButton(), NavigateButton()],
      ),
    );
  }
}
