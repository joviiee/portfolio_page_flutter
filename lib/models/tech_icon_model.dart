import 'package:portfolio_page/data/tech_icon_map.dart';

class TechIconModel {
  final String name;
  final String assetPath;

  TechIconModel._({required this.name,required this.assetPath});

factory TechIconModel(String appName){
  final assetPath = techIconMap[appName] ?? 'assets/logos/tech/python.png';
    return TechIconModel._(name:appName, assetPath: assetPath);
}
}
