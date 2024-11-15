import 'package:flutter/material.dart';
import 'package:portfolio_page/data/social_media_map.dart';
import 'package:portfolio_page/models/social_media_model.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaPallette extends StatelessWidget {
  // Convert each map in socialMediaData to a SocialMedia instance
  final List<SocialMediaModel> socialMediaLinks =
      socialMediaData.map((data) => SocialMediaModel.fromMap(data)).toList();

  SocialMediaPallette({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize;

    if (screenWidth < 540) {
      iconSize = 12;
    } else if (540 <= screenWidth && screenWidth <= 1024) {
      iconSize = 24;
    } else if (1024 < screenWidth && screenWidth <= 1200) {
      iconSize = 24;
    } else {
      iconSize = 20;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialMediaLinks.map((socialMedia) {
        return IconButton(
          icon: CircleAvatar(
            backgroundColor: colorScheme.tertiary,
            radius: iconSize,
            child: ClipOval(
              // radius: BorderRadius.circular(iconSize),
              child: Image.asset(
                socialMedia.assetPath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          tooltip: socialMedia.name, // Tooltip with platform name
          onPressed: () async {
            if (await canLaunchUrl(socialMedia.url)) {
              await launchUrl(socialMedia.url);
            } else {
              // throw 'Could not launch ${socialMedia.url}';
            }
          },
        );
      }).toList(),
    );
  }
}
