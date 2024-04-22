class AuthorModelFields {
  static const String id = "id";
  static const String email = "email";
  static const String name = "name";
  static const String uniqueToken = "uniqueToken";
}

class AuthorModel {
  final int id;
  final String email;
  final String name;
  final String uniqueToken;
  AuthorModel(
      {required this.id, required this.email, required this.name, required this.uniqueToken});
  factory AuthorModel.fromJson(Map<String, dynamic> json) {
   return AuthorModel(
      id: json[AuthorModelFields.id] as int? ?? 0,
      email: json[AuthorModelFields.email] as String? ?? "",
      name: json[AuthorModelFields.name] as String? ?? "",
      uniqueToken: json[AuthorModelFields.uniqueToken] as String? ?? "",
    );
  }
  AuthorModel copyWith({
    int? id,
    String? email,
    String? name,
    String? uniqueToken,
  }){
    return AuthorModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      uniqueToken: uniqueToken ?? this.uniqueToken,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      AuthorModelFields.id: id,
      AuthorModelFields.email: email,
      AuthorModelFields.name: name,
      AuthorModelFields.uniqueToken: uniqueToken,
    };
  }
  @override
  String toString(){
    return """
    ${AuthorModelFields.id}: $id
    ${AuthorModelFields.email}: $email
    ${AuthorModelFields.name}: $name
    ${AuthorModelFields.uniqueToken}: $uniqueToken
    """;
  }
}
