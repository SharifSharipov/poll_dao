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
  static const String email = "email";
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
  final String email;

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
    required this.email,
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
    String? email,
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
      userId: userId ?? this.userId,
      email: email ?? this.email,
    );
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
        email: json[ProfileModelFields.email] as String? ?? "",
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
        ProfileModelFields.email: email,
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
          email: "",
        );
}
