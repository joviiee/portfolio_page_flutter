import 'package:flutter/material.dart';
import 'package:portfolio_page/about/about.dart';
import 'package:portfolio_page/contact_me/contact_me.dart';
import 'package:portfolio_page/menu_bar/menu_bar.dart';
import 'package:portfolio_page/projects/projects.dart';
import 'package:portfolio_page/skills/skills.dart';
import 'package:portfolio_page/theme/theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athul V Gopalakrishnan',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  // Define keys for each section
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey contactMeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AboutMe(contactMeKey: contactMeKey),
                  MyProjects(
                    projectsKey: projectsKey,
                  ),
                  MySkills(
                    skillsKey: skillsKey,
                  ),
                  ContactMe(
                    contactMeKey: contactMeKey,
                  )
                ],
                // children: [ContactMe()],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MyMenuBar(
                projectsKey: projectsKey,
                skillsKey: skillsKey,
                contactMeKey: contactMeKey,
              ),
            )
          ])),
    );
  }
}
