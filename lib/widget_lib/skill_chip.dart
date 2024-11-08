import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    dynamic chipHeight, chipWidth;
    dynamic iconSize, labelSize, labelPadding;

    if (760 <= screenWidth && screenWidth <= 1024) {
      iconSize = 20;
      labelSize = 12;
      labelPadding = 10;
    } else if (1024 < screenWidth && screenWidth <= 1200) {
      iconSize = 20;
      labelSize = 12;
      labelPadding = 10;
    } else {
      iconSize = 30;
      labelSize = 18;
      labelPadding = 15;
    }

    return Chip(
      elevation: 5,
      avatar: Icon(
        Icons.flutter_dash,
        color: colorScheme.onPrimary,
        size: iconSize,
      ),
      label: const Text(
        'flutter',
        style: TextStyle(fontWeight: FontWeight.w100),
      ),
      labelPadding: EdgeInsets.only(left: labelPadding),
      backgroundColor: colorScheme.primary,
      labelStyle: TextStyle(color: colorScheme.onPrimary, fontSize: labelSize),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
      side: BorderSide.none,
    );
  }
}
