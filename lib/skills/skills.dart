import 'package:flutter/material.dart';
import 'package:portfolio_page/data/skills_map.dart';
import 'package:portfolio_page/models/skills_model.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/skill_tab.dart';

class MySkills extends StatelessWidget {
  final Key skillsKey;

  final List<SkillsModel> skills =
      skillsMap.map((e) => SkillsModel.fromMap(e)).toList();

  MySkills({super.key, required this.skillsKey});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double titleSize, centralWidth;
    EdgeInsets bottomPadding = const EdgeInsets.only(bottom: 60);

    if (screenWidth < 540) {
      centralWidth = screenWidth * 0.75;
      titleSize = 25;
      bottomPadding = const EdgeInsets.only(bottom: 10);
    } else if (540 <= screenWidth && screenWidth <= 1024) {
      centralWidth = screenWidth * 0.75;
      titleSize = 45;
    } else if (1024 < screenWidth && screenWidth <= 1500) {
      centralWidth = 800;
      titleSize = 55;
    } else {
      centralWidth = 850;

      titleSize = 55;
    }

    return Container(
        key: skillsKey,
        width: screenWidth,
        padding: bottomPadding,
        decoration: BoxDecoration(color: colorScheme.secondary),
        child: Column(
          children: [
            Text(
              'My Skills',
              style: TextStyle(
                  fontFamily: 'Ink Free',
                  fontSize: titleSize,
                  height: 5,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondary),
            ),
            SizedBox(
              width: centralWidth,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: SkillTab(skill: skills[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
