import 'package:flutter/material.dart';
import 'package:portfolio_page/data/projects_map.dart';
import 'package:portfolio_page/models/projects_model.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:portfolio_page/widget_lib/project_card.dart';

class MyProjects extends StatelessWidget {
  final Key projectsKey;

  final List<ProjectsModel> projects = projectsMap.map((e) => ProjectsModel.fromMap(e)).toList();

  MyProjects({super.key, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleSize;
    double centralWidth,
        crossAxisSpacing = 20,
        mainAxisSpacing,
        bottomPadding;
    int crossAxisCount = 3;

    if (screenWidth < 540) {
      titleSize = 25;
      crossAxisCount = 1;
      centralWidth = screenWidth * 0.70;
      mainAxisSpacing = 20;
      bottomPadding = 40;
    } else if (540 < screenWidth && screenWidth <= 1024) {
      titleSize = 45;
      crossAxisCount = 2;
      centralWidth = screenWidth * 0.75;
      mainAxisSpacing = 20;
      bottomPadding = 60;
    } else if (1024 < screenWidth && screenWidth <= 1500) {
      titleSize = 55;
      bottomPadding = 60;
      centralWidth = 840;
      mainAxisSpacing = 20;
    } else {
      titleSize = 45;
      centralWidth = 870;
      mainAxisSpacing = 20;
      bottomPadding = 80;
    }

    return Container(
      key: projectsKey,
      padding: EdgeInsets.only(bottom: bottomPadding),
      width: screenWidth,
      decoration: BoxDecoration(color: colorScheme.primary),
      child: Column(
        children: [
          Text(
            'My Projects',
            style: TextStyle(
                fontFamily: 'Ink Free',
                fontSize: titleSize,
                height: 5,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary),
          ),
          SizedBox(
            width: centralWidth,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: crossAxisSpacing,
                    mainAxisSpacing: mainAxisSpacing),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index]);
                }),
          ),
        ],
      ),
    );
  }
}
