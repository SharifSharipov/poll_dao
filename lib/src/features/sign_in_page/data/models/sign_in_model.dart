/*{
    "email": "martinhappy2017@icloud.com",
    "password": "12345678"
}*/

class SignInModelFields {
  static const String email = "email";
  static const String password = "password";
}

class SignInModel {
  final String email;
  final String password;
  SignInModel({required this.email, required this.password});

  SignInModel copyWith({String? email, String? password}) {
    return SignInModel(email: email ?? this.email, password: password ?? this.password);
  }

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
        email: json[SignInModelFields.email] as String? ?? "",
        password: json[SignInModelFields.password] as String? ?? "");
  }
  Map<String, dynamic> toJson() =>
      {SignInModelFields.email: email, SignInModelFields.password: password};
  @override
  String toString() {
    return """
    ${SignInModelFields.email}:$email,
    ${SignInModelFields.password}:$password
    """;
  }
}

