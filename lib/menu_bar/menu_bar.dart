import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMenuBar extends StatelessWidget {
  final GlobalKey projectsKey, skillsKey, contactMeKey;
  const MyMenuBar(
      {super.key,
      required this.projectsKey,
      required this.contactMeKey,
      required this.skillsKey});

// Function to scroll to the specified section
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
    double barHeight = 80;

    if (screenWidth < 540) {
    } else if (540 <= screenWidth && screenWidth <= 1024) {
    } else if (1024 < screenWidth && screenWidth <= 1200) {
    } else {}

    return Container(
      height: barHeight,
      decoration: BoxDecoration(color: colorScheme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'VG',
              style: TextStyle(
                  height: 2,
                  letterSpacing: 2,
                  color: colorScheme.tertiary,
                  fontFamily: 'Jim Nightshade',
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
            ),
          ),
          if (screenWidth > 540)
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [colorScheme.primary, colorScheme.secondary],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(60),
                ),
                height: 50,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                          onPressed: () => scrollToSection(projectsKey),
                          child: Text('PROJECTS',
                              style: TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter'))),
                      TextButton(
                          onPressed: () => scrollToSection(skillsKey),
                          child: Text('SKILLS',
                              style: TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter'))),
                      TextButton(
                          onPressed: () => scrollToSection(contactMeKey),
                          child: Text('CONTACT ME',
                              style: TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter'))),
                      TextButton(
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
                          child: Text('RESUME',
                              style: TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter'))),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
