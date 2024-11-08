import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    dynamic titleSize, seperatorHeight;
    dynamic buttonWidth, buttonHeight, buttonTextSize;

    if (screenWidth < 700) {
      titleSize = 30;
      seperatorHeight = 15;
      buttonHeight = 40;
      buttonWidth = 170;
      buttonTextSize = 15;
    }
    // else if (540 <= screenWidth && screenWidth <= 1024) {
    //   titleSize = 60;
    //   barHeight = 100;
    //   seperatorHeight = 20;
    //   buttonHeight = 50;
    //   buttonWidth = 225;
    //   buttonTextSize = 23;
    // }
    else if (700 <= screenWidth && screenWidth <= 1500) {
      titleSize = 60;
      seperatorHeight = 10;
      buttonHeight = 65;
      buttonWidth = 295;
      buttonTextSize = 30;
    } else {
      titleSize = 75;
      seperatorHeight = 10;
      buttonHeight = 75;
      buttonWidth = 375;
      buttonTextSize = 30;
    }

    return Container(
      decoration: BoxDecoration(color: colorScheme.secondary),
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth / 5, top: screenHeight / 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi There,\nI'm Athul\nA Developer",
              style: TextStyle(
                  fontFamily: 'Ink Free',
                  fontSize: titleSize,
                  color: colorScheme.onSecondary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: seperatorHeight,
            ),
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Get In Touch',
                  style: TextStyle(
                      fontFamily: 'Ink Free',
                      fontWeight: FontWeight.bold,
                      fontSize: buttonTextSize),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
