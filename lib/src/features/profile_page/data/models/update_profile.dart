class UpdateProfileModelFields {
  static const String location = "location";
  static const String age = "age";
  static const String name = "name";
  static const String education = "education";
}

class UpdateProfileModel {
  final String location;
  final int age;
  final String name;
  final String education;

  UpdateProfileModel({
    required this.location,
    required this.age,
    required this.name,
    required this.education,
  });
  UpdateProfileModel copyWith({
    String? location,
    int? age,
    String? name,
    String? education,
  }) {
    return UpdateProfileModel(
        location: location ?? this.location,
        age: age ?? this.age,
        name: name ?? this.name,
        education: education ?? this.education);
  }

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
        location: json[UpdateProfileModelFields.location] as String? ?? "",
        age: json[UpdateProfileModelFields.age] as int? ?? 0,
        name: json[UpdateProfileModelFields.name] as String? ?? "",
        education: json[UpdateProfileModelFields.education] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        UpdateProfileModelFields.location: location,
        UpdateProfileModelFields.age: age,
        UpdateProfileModelFields.name: name,
        UpdateProfileModelFields.education: education,
      };
}
