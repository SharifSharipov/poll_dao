class UserModelFields {
  static const String name = "name";
  static const String email = "email";
  static const String password = "password";
}
//http://94.131.10.253:3000/auth/sign-up
class UserModel {
  final String name;
  final String email;
  final String password;
  UserModel({required this.name, required this.email, required this.password});
  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
        name: name ?? this.name, email: email ?? this.email, password: password ?? this.password);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[UserModelFields.name] as String? ?? "",
      email: json[UserModelFields.email] as String? ?? "",
      password: json[UserModelFields.password] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserModelFields.name: name,
      UserModelFields.email: email,
      UserModelFields.password: password,
    };
  }

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, password: $password}';
  }
}
