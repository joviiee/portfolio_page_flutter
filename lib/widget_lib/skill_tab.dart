import 'package:flutter/material.dart';
import 'package:portfolio_page/models/skills_model.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/skill_chip.dart';
import 'package:portfolio_page/widget_lib/skill_chip_mobile.dart';

class SkillTab extends StatelessWidget {
  final SkillsModel skill;

  const SkillTab({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    dynamic centralWidth, techFontSize, techFontHeight;
    double chipHolderWidth,
        chipSpacing = 10,
        chipRunSpacing = 10,
        seperatorWidth;
    double cardHeight, cardWidth, cardBorderRadius;

    if (screenWidth <= 540) {
      techFontSize = 10;
      techFontHeight = 2;
      centralWidth = screenWidth - 90;
      chipHolderWidth = centralWidth * 0.35;
      cardWidth = centralWidth * 0.4;
      cardHeight = cardWidth * 0.75;
      cardBorderRadius = 10;
      seperatorWidth = centralWidth * 0.1;
    } else if (screenWidth > 540 && screenWidth <= 760) {
      techFontSize = 10;
      techFontHeight = 4;
      centralWidth = screenWidth * 0.65;
      chipHolderWidth = centralWidth * 0.45;
      cardWidth = centralWidth * 0.4;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = centralWidth * 0.1;
      cardBorderRadius = 10;
    } else if (760 < screenWidth && screenWidth <= 1024) {
      techFontSize = 12;
      techFontHeight = 5;
      centralWidth = screenWidth * 0.65;
      chipHolderWidth = centralWidth * 0.55;
      cardWidth = centralWidth * 0.35;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = centralWidth * 0.1;
      cardBorderRadius = 10;
    } else if (1024 < screenWidth && screenWidth <= 1500) {
      techFontSize = 15;
      techFontHeight = 5;
      chipHolderWidth = 400;
      cardWidth = 260;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = 80;
      cardBorderRadius = 10;
    } else {
      techFontSize = 15;
      techFontHeight = 5;
      centralWidth = 850;
      chipHolderWidth = 450;
      cardWidth = 280;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = 90;
      cardBorderRadius = 10;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: screenWidth <= 760
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Card(
              // margin: EdgeInsets.all(screenWidth * 0.01),
              color: colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardBorderRadius),
              ),
              child: Column(children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: Image.asset(
                        skill.iconPath,
                        fit: BoxFit.cover,
                        color: colorScheme.onSecondary,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            skill.skill,
                            style: TextStyle(
                                color: colorScheme.onPrimary,
                                fontSize: screenWidth > 560 ? 15 : 10),
                          ),
                          if (screenWidth > 1024)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                skill.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: colorScheme.onPrimary, fontSize: 11),
                              ),
                            )
                        ],
                      )),
                )
              ]),
            ),
          ),
          SizedBox(
            width: seperatorWidth,
          ),
          SizedBox(
            width: chipHolderWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Technologies used :',
                  style: TextStyle(
                      color: colorScheme.tertiary,
                      fontSize: techFontSize,
                      height: techFontHeight),
                ),
                Wrap(
                  spacing: chipSpacing,
                  runSpacing: chipRunSpacing,
                  children: List.generate(skill.techUsed.length, (index) {
                    return screenWidth < 760
                        ? SkillChipMobile(tech: skill.techUsed[index])
                        : SkillChip(tech: skill.techUsed[index]);
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
