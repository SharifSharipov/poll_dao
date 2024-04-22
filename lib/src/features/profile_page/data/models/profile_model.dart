
class ProfileModelFields {
  static const String emailAddress = "email_address";
  static const String username = "username";
  static const String age = "age";
  static const String gender = "gender";
  static const String externalEducationLevel = "external_education_level";
  static const String language = "language";
  static const String location = "location";
  static const String nationality = "nationality";
}

class ProfileModel {
  final String emailAddress;
  final String username;
  final int age;
  final String gender;
  final String externalEducationLevel;
  final String language;
  final String location;
  final String nationality;
  ProfileModel(
      {required this.emailAddress,
        required this.username,
        required this.age,
        required this.gender,
        required this.externalEducationLevel,
        required this.language,
        required this.location,
        required this.nationality});
  ProfileModel copyWith({
    String? emailAddress,
    String? username,
    int? age,
    String? gender,
    String? externalEducationLevel,
    String? language,
    String? location,
    String? nationality,
  }) {
    return ProfileModel(
        emailAddress: emailAddress ?? this.emailAddress,
        username: username ?? this.username,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        externalEducationLevel: externalEducationLevel ?? this.externalEducationLevel,
        language: language ?? this.language,
        location: location ?? this.location,
        nationality: nationality ?? this.nationality);
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        emailAddress: json[ProfileModelFields.emailAddress] as String? ?? "",
        username: json[ProfileModelFields.username] as String? ?? "",
        age: json[ProfileModelFields.age] as int? ?? 0,
        gender: json[ProfileModelFields.gender] as String? ?? "",
        externalEducationLevel: json[ProfileModelFields.externalEducationLevel] as String? ?? "",
        language: json[ProfileModelFields.language] as String? ?? "",
        location: json[ProfileModelFields.location] as String? ?? "",
        nationality: json[ProfileModelFields.nationality] as String? ?? "");
  }
  Map<String,dynamic>toJson()=>{
    ProfileModelFields.emailAddress:emailAddress,
    ProfileModelFields.username:username,
    ProfileModelFields.age:age,
    ProfileModelFields.gender:gender,
    ProfileModelFields.externalEducationLevel:externalEducationLevel,
    ProfileModelFields.language:language,
    ProfileModelFields.location:location,
    ProfileModelFields.nationality:nationality
  };

  @override
  String toString() {
    return """
    ${ProfileModelFields.emailAddress}:$emailAddress,
    ${ProfileModelFields.username}:$username,
    ${ProfileModelFields.age}:$age,
    ${ProfileModelFields.gender}:$gender,
    ${ProfileModelFields.externalEducationLevel}:$externalEducationLevel,
    ${ProfileModelFields.language}:$language,
    ${ProfileModelFields.location}:$location,
    ${ProfileModelFields.nationality}:$nationality
    """;
  }
}