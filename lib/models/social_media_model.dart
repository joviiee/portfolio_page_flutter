class SocialMediaModel {
  final String name;
  final String assetPath;
  final Uri url;

  SocialMediaModel(
      {required this.name, required this.assetPath, required this.url});

  // Factory method to create a SocialMedia instance from a map
  factory SocialMediaModel.fromMap(Map<String, String> data) {
    return SocialMediaModel(
      name: data['name']!,
      assetPath: data['assetPath']!,
      url: Uri.parse(data['url']!),
    );
  }
}
