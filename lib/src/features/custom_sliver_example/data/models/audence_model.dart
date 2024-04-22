class AudienceModelFields {
  static const String maternalLang = "maternalLang";
  static const String age = "age";
  static const String gender = "gender";
  static const String location = "location";
  static const String education = "education";
  static const String nationality = "nationality";
  static const String biometryPassed = "biometryPassed";
}

class AudienceModel {
  final String maternalLang;
  final String age;
  final String gender;
  final String location;
  final String education;
  final String nationality;
  final String biometryPassed;

  AudienceModel({
    required this.maternalLang,
    required this.age,
    required this.gender,
    required this.location,
    required this.education,
    required this.nationality,
    required this.biometryPassed,
  });
  AudienceModel copyWith({
    String? maternalLang,
    String? age,
    String? gender,
    String? location,
    String? education,
    String? nationality,
    String? biometryPassed,
  }) {
    return AudienceModel(
        maternalLang: maternalLang ?? this.maternalLang,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        location: location ?? this.location,
        education: education ?? this.education,
        nationality: nationality ?? this.nationality,
        biometryPassed: biometryPassed ?? this.biometryPassed);
  }

  factory AudienceModel.fromJson(Map<String, dynamic> json) {
    return AudienceModel(
      maternalLang: json[AudienceModelFields.maternalLang] as String? ?? "",
      age: json[AudienceModelFields.age] as String? ?? "",
      gender: json[AudienceModelFields.gender] as String? ?? "",
      location: json[AudienceModelFields.location] as String? ?? "",
      education: json[AudienceModelFields.education] as String? ?? "",
      nationality: json[AudienceModelFields.nationality] as String? ?? "",
      biometryPassed: json[AudienceModelFields.biometryPassed] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        AudienceModelFields.maternalLang: maternalLang,
        AudienceModelFields.age: age,
        AudienceModelFields.gender: gender,
        AudienceModelFields.location: location,
        AudienceModelFields.education: education,
        AudienceModelFields.nationality: nationality,
        AudienceModelFields.biometryPassed: biometryPassed
      };
  @override
  String toString() {
    return 'AudienceModel(maternalLang: $maternalLang, age: $age, gender: $gender, location: $location, education: $education, nationality: $nationality, biometryPassed: $biometryPassed)';
  }
}
