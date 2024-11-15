import 'package:flutter/material.dart';
import 'package:portfolio_page/models/projects_model.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final ProjectsModel project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardRadius = 10, cardMargin = 7;

    if (540 <= screenWidth && screenWidth <= 1024) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 5,
                child: Image.asset(
                  project.imagePath,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.only(left: 3, top: 4),
              child: Text(
                project.name,
                style: TextStyle(
                    fontSize:
                        screenWidth <= 1024 && screenWidth > 560 ? 15 : 12,
                    color: colorScheme.onSecondary),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: project.techUsed.length,
                        itemBuilder: (context, index) {
                          return Tooltip(
                            message: project.techUsed[index].name,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: CircleAvatar(
                                backgroundColor: colorScheme.onPrimary,
                                radius: 10,
                                child: ClipOval(
                                  child: Image.asset(
                                    project.techUsed[index].assetPath,
                                    fit: BoxFit.cover,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: IconButton(
                      tooltip: 'View on github',
                      icon: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(11)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset(
                            'assets/logos/social_media/github.png',
                            fit: BoxFit.cover,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        final scaffoldMessenger = ScaffoldMessenger.of(context);
                        if (await canLaunchUrl(project.gitUrl)) {
                          await launchUrl(project.gitUrl);
                        } else {
                          scaffoldMessenger.showSnackBar(SnackBar(
                              content: Text("Could not validate the form")));
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
