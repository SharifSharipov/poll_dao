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
  final String name;
  
  SignInModel({required this.email, required this.name});

  SignInModel copyWith({String? email, String? name}) {
    return SignInModel(email: email ?? this.email, name: name ?? this.name);
  }

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
        email: json["user"][SignInModelFields.email],
        name: json["user"]["name"]);
  }
  Map<String, dynamic> toJson() =>
      {SignInModelFields.email: email, "name": name};
  @override
  String toString() {
    return """
    ${SignInModelFields.email}:$email,
    "name":$name
    """;
  }
}

