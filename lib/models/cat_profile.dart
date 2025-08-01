class CatProfile {
  final String name;
  final int age;
  final String bio;
  final String imagePath;

  CatProfile({
    required this.name,
    required this.age,
    required this.bio,
    required this.imagePath,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CatProfile &&
        other.name == name &&
        other.age == age &&
        other.bio == bio &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode =>
      name.hashCode ^ age.hashCode ^ bio.hashCode ^ imagePath.hashCode;
}
