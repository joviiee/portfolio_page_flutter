import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/skill_tab.dart';

class MySkills extends StatelessWidget {
  final Key skillsKey;
  const MySkills({Key? key, required this.skillsKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    dynamic titleSize, centralWidth;
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: const SkillTab(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
