import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    dynamic cardRadius, cardMargin;

    if (screenWidth < 540) {
      cardRadius = 20;
      cardMargin = 7;
    } else if (540 <= screenWidth && screenWidth <= 1024) {
      cardRadius = 15;
      cardMargin = 25;
    } else if (1024 < screenWidth && screenWidth <= 1500) {
      cardRadius = 15;
      cardMargin = 10;
    } else {
      cardRadius = 15;
      cardMargin = 5;
    }

    return Card(
      color: colorScheme.secondary,
      margin: EdgeInsets.all(cardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Image.asset(
              'assets/images/image.jpg',
              fit: BoxFit.cover,
            )),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.01, top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Personality Prediction Model',
                    style:
                        TextStyle(fontSize: 12, color: colorScheme.onSecondary),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: screenWidth * 0.01, bottom: 4),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Know more ...',
                      style: TextStyle(
                          fontSize: 12, color: colorScheme.onSecondary),
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
