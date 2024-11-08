import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/desktop_contact_me_form.dart';
import 'package:portfolio_page/widget_lib/mobile_contact_me_form.dart';

class ContactMe extends StatelessWidget {
  final Key contactMeKey;
  const ContactMe({Key? key,required this.contactMeKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    dynamic titleSize, bottomBoxHeight = 60, bottomFontSize;
    dynamic dividerThickness = 2, bottomLogoSize;

    if (screenWidth < 540) {
      titleSize = 25;
      dividerThickness = 1;
      bottomFontSize = 15;
      bottomLogoSize = 20;
    } else if (600 < screenWidth && screenWidth <= 1024) {
      titleSize = 45;
      bottomFontSize = 20;
      bottomLogoSize = 25;
    } else {
      titleSize = 55;
      bottomBoxHeight = 75;
      bottomFontSize = 25;
      bottomLogoSize = 30;
    }

    return Container(
      key:contactMeKey,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Divider(
              color: colorScheme.tertiary,
              thickness: dividerThickness,
            ),
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
