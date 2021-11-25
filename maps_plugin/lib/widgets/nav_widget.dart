import 'package:flutter/material.dart';
//widgets
import 'buttons/arrow_back_button.dart';
import 'buttons/navigate_button.dart';
class NavWidget extends StatelessWidget {
  const NavWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height*0.07,
      width: deviceSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ArrowBackButton(),
          NavigateButton(),
        ],
      ),
    );
  }
}


