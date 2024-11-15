import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  final GlobalKey contactMeKey;
  const AboutMe({super.key, required this.contactMeKey});

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleSize = 30;
    double seperatorHeight = 15;
    double buttonHeight = 40;
    double buttonWidth = 170;
    double buttonTextSize = 15;

    if (700 <= screenWidth && screenWidth <= 1500) {
      titleSize = 60;
      seperatorHeight = 10;
      buttonHeight = 65;
      buttonWidth = 295;
      buttonTextSize = 30;
    } else if (screenWidth > 1500) {
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
            screenWidth > 540
                ? SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () => scrollToSection(contactMeKey),
                      child: Text(
                        'Get In Touch',
                        style: TextStyle(
                            fontFamily: 'Ink Free',
                            fontWeight: FontWeight.bold,
                            fontSize: buttonTextSize),
                      ),
                    ),
                  )
                : SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () async {
                        final scaffoldMessenger = ScaffoldMessenger.of(context);
                        if (await canLaunchUrl(Uri.parse(
                            'https://drive.google.com/file/d/1tavZIXs_NWjnPqc6lDX3OmIGt35nQdXh/view?usp=sharing'))) {
                          await launchUrl(Uri.parse(
                              'https://drive.google.com/file/d/1tavZIXs_NWjnPqc6lDX3OmIGt35nQdXh/view?usp=sharing'));
                        } else {
                          scaffoldMessenger.showSnackBar(SnackBar(
                              content:
                                  Text("Could not load resume at the moment")));
                        }
                      },
                      child: Text(
                        'See Resume',
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
