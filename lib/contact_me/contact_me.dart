import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/desktop_contact_me_form.dart';
import 'package:portfolio_page/widget_lib/mobile_contact_me_form.dart';
import 'package:portfolio_page/widget_lib/social_media_pallette.dart';

class ContactMe extends StatelessWidget {
  final Key contactMeKey;
  const ContactMe({super.key, required this.contactMeKey});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleSize, bottomBoxHeight = 60, bottomFontSize;
    double dividerThickness = 2, bottomLogoSize, contactsBoxHeight;

    if (screenWidth < 540) {
      titleSize = 25;
      dividerThickness = 1;
      bottomFontSize = 15;
      contactsBoxHeight = 60;
      bottomLogoSize = 20;
    } else if (600 < screenWidth && screenWidth <= 1024) {
      titleSize = 45;
      bottomFontSize = 20;
      contactsBoxHeight = 150;
      bottomLogoSize = 25;
    } else {
      titleSize = 55;
      contactsBoxHeight = 150;
      bottomBoxHeight = 75;
      bottomFontSize = 25;
      bottomLogoSize = 30;
    }

    return Container(
      key: contactMeKey,
      decoration: BoxDecoration(
        color: colorScheme.primary,
      ),
      child: Column(
        children: [
          Text(
            'Get In Touch . . .',
            style: TextStyle(
                fontFamily: 'Ink Free',
                fontSize: titleSize,
                height: 5,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary),
          ),
          Center(
              child: screenWidth < 540
                  ? MobileContactMeForm()
                  : DesktopContactMeForm()),
          SizedBox(
              height: contactsBoxHeight,
              child: Center(child: SocialMediaPallette())),
          Divider(
            color: colorScheme.tertiary,
            thickness: dividerThickness,
          ),
          SizedBox(
            height: bottomBoxHeight,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: 'Designed and developed by ',
                      style: TextStyle(
                          color: colorScheme.tertiary,
                          fontFamily: 'Ink Free',
                          wordSpacing: 5,
                          fontSize: bottomFontSize),
                      children: [
                    TextSpan(
                        text: 'VG',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jim Nightshade',
                            fontSize: bottomLogoSize))
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
