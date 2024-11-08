import 'package:flutter/material.dart';

class SkillChipMobile extends StatelessWidget {
  const SkillChipMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Icon(
      Icons.flutter_dash,
      size: 20,
    );
  }
}
