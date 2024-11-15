import 'package:flutter/material.dart';
import 'package:portfolio_page/models/tech_icon_model.dart';
import 'package:portfolio_page/theme/theme.dart';

class SkillChipMobile extends StatelessWidget {
  final TechIconModel tech;
  const SkillChipMobile({super.key, required this.tech});

  @override
  Widget build(BuildContext context) {

    return Tooltip(
      message: tech.name,
      child: CircleAvatar(
        backgroundColor: colorScheme.onPrimary,
        radius: 10,
        child: ClipOval(
          child: Image.asset(
            tech.assetPath,
            fit: BoxFit.cover,
            width: 10,
            height: 10,
          ),
        ),
      ),
    );
  }
}
