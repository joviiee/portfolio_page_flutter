import 'package:flutter/material.dart';
import 'package:portfolio_page/models/tech_icon_model.dart';
import 'package:portfolio_page/theme/theme.dart';

class SkillChip extends StatelessWidget {
  final TechIconModel tech;
  const SkillChip({super.key, required this.tech});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double labelSize, labelPadding;

    if (760 <= screenWidth && screenWidth <= 1024) {
      labelSize = 12;
      labelPadding = 10;
    } else if (1024 < screenWidth && screenWidth <= 1200) {
      labelSize = 12;
      labelPadding = 10;
    } else {
      labelSize = 18;
      labelPadding = 15;
    }

    return Chip(
      elevation: 5,
      avatar: CircleAvatar(
        backgroundColor: colorScheme.onPrimary,
        radius: 15,
        child: ClipOval(
          child: Image.asset(
            tech.assetPath,
            fit: BoxFit.cover,
            width: 17,
            height: 17,
          ),
        ),
      ),
      label: Text(
        tech.name,
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
