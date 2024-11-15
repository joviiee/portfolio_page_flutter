import 'package:portfolio_page/models/tech_icon_model.dart';

class ProjectsModel {
  final String name;
  final String imagePath;
  final List<TechIconModel> techUsed;
  final Uri gitUrl;

  ProjectsModel(
      {required this.name, required this.imagePath, required this.gitUrl,required this.techUsed});

  // Factory method to create a SocialMedia instance from a map
  factory ProjectsModel.fromMap(Map<String, Object> data) {
    List<TechIconModel> techModelList = (data['techUsed'] as List).map((x) => TechIconModel(x)).toList();
    return ProjectsModel(
      name: (data['name'] as String),
      imagePath: (data['imagePath'] as String),
    techUsed: techModelList,
      gitUrl: Uri.parse((data['gitLink'] as String)),
    );
  }
}
