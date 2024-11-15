import 'package:portfolio_page/models/tech_icon_model.dart';

class SkillsModel {
  final String skill;
  final String iconPath;
  final List<TechIconModel> techUsed;
  final String description;

  SkillsModel(
      {required this.skill,
      required this.iconPath,
      required this.description,
      required this.techUsed});

  // Factory method to create a SocialMedia instance from a map
  factory SkillsModel.fromMap(Map<String, Object> data) {
    List<TechIconModel> techModelList =
        (data['techUsed'] as List).map((x) => TechIconModel(x)).toList();
    return SkillsModel(
      skill: (data['skill'] as String),
      iconPath: (data['iconPath'] as String),
      techUsed: techModelList,
      description: (data['description'] as String),
    );
  }
}
