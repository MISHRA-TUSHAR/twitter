import 'package:flutter/material.dart';
import 'package:twitter_flutter/constants/const.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Image.asset(
          twitter,
          fit: BoxFit.contain,
          height: 30,
        ),
      ),
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: true,
    );
  }
}
