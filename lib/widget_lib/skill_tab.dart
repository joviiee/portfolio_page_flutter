import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/skill_chip.dart';
import 'package:portfolio_page/widget_lib/skill_chip_mobile.dart';

class SkillTab extends StatelessWidget {
  const SkillTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    dynamic centralWidth, techFontSize, techFontHeight;
    dynamic chipHolderWidth, chipSpacing, chipRunSpacing, seperatorWidth;
    dynamic cardHeight, cardWidth, cardBorderRadius;

    if (screenWidth <= 540) {
      techFontSize = 10;
      techFontHeight = 2;
      centralWidth = screenWidth - 90;
      chipHolderWidth = centralWidth * 0.43;
      cardWidth = centralWidth * 0.4;
      cardHeight = cardWidth * 0.75;
      cardBorderRadius = 10;
      chipSpacing = 20;
      chipRunSpacing = 15;
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
      chipSpacing = 20;
      chipRunSpacing = 20;
    } else if (760 < screenWidth && screenWidth <= 1024) {
      techFontSize = 12;
      techFontHeight = 5;
      centralWidth = screenWidth * 0.65;
      chipHolderWidth = centralWidth * 0.55;
      cardWidth = centralWidth * 0.35;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = centralWidth * 0.1;
      cardBorderRadius = 10;
      chipSpacing = 5;
      chipRunSpacing = 10;
    } else if (1024 < screenWidth && screenWidth <= 1500) {
      techFontSize = 15;
      techFontHeight = 5;
      chipHolderWidth = 400;
      cardWidth = 260;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = 80;
      cardBorderRadius = 10;
      chipSpacing = 5;
      chipRunSpacing = 15;
    } else {
      techFontSize = 15;
      techFontHeight = 5;
      centralWidth = 850;
      chipHolderWidth = 450;
      cardWidth = 280;
      cardHeight = cardWidth * 0.75;
      seperatorWidth = 90;
      cardBorderRadius = 10;
      chipSpacing = 25;
      chipRunSpacing = 27;
    }

    return Row(
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
            child: ClipRRect(
              child: Image.asset(
                'assets/images/image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: seperatorWidth,
        ),
        SizedBox(
          width: chipHolderWidth,
          child: Column(
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
                children: List.generate(6, (index) {
                  return screenWidth < 760 ? SkillChipMobile() : SkillChip();
                }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
