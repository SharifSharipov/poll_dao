class ProfileModelFields {
  static const String id = "id";
  static const String maternalLang = "maternalLang";
  static const String age = "age";
  static const String name = "name";
  static const String gender = "gender";
  static const String location = "location";
  static const String education = "education";
  static const String nationality = "nationality";
  static const String biometryPassed = "biometryPassed";
  static const String userId = "userId";
}

class ProfileModel {
  final int id;
  final dynamic maternalLang;
  final int age;
  final String? name;
  final String gender;
  final String location;
  final String education;
  final String nationality;
  final dynamic biometryPassed;
  final int userId;

  ProfileModel({
    required this.id,
    required this.maternalLang,
    required this.age,
    this.name,
    required this.gender,
    required this.location,
    required this.education,
    required this.nationality,
    required this.biometryPassed,
    required this.userId,
  });

  ProfileModel copyWith({
    int? id,
    dynamic maternalLang,
    int? age,
    String? name,
    String? gender,
    String? location,
    String? education,
    String? nationality,
    dynamic biometryPassed,
    int? userId,
  }) {
    return ProfileModel(
        id: id ?? this.id,
        maternalLang: maternalLang ?? this.maternalLang,
        age: age ?? this.age,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        location: location ?? this.location,
        education: education ?? this.education,
        nationality: nationality ?? this.nationality,
        biometryPassed: biometryPassed ?? this.biometryPassed,
        userId: userId ?? this.userId);
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json[ProfileModelFields.id] as int? ?? 0,
        maternalLang: json[ProfileModelFields.maternalLang],
        age: json[ProfileModelFields.age] as int? ?? 0,
        name: json[ProfileModelFields.name] as String? ?? "",
        gender: json[ProfileModelFields.gender] as String? ?? "",
        location: json[ProfileModelFields.location] as String? ?? "",
        education: json[ProfileModelFields.education] as String? ?? "",
        nationality: json[ProfileModelFields.nationality] as String? ?? "",
        biometryPassed: json[ProfileModelFields.biometryPassed],
        userId: json[ProfileModelFields.userId] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        ProfileModelFields.id: id,
        ProfileModelFields.maternalLang: maternalLang,
        ProfileModelFields.age: age,
        ProfileModelFields.name: name,
        ProfileModelFields.gender: gender,
        ProfileModelFields.location: location,
        ProfileModelFields.education: education,
        ProfileModelFields.nationality: nationality,
        ProfileModelFields.biometryPassed: biometryPassed,
        ProfileModelFields.userId: userId,
      };

  ProfileModel.empty()
      : this(
          id: 0,
          maternalLang: "",
          age: 0,
          name: "",
          gender: "",
          location: "",
          education: "",
          nationality: "",
          biometryPassed: "",
          userId: 0,
        );
}
