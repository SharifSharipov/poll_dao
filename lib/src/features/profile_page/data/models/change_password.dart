
class ChangePasswordFields {
  static const String oldPassword = "old_password";
  static const String newPassword = "new_password";
}

class ChangePasswordModel {
  final String oldPassword;
  final String newPassword;
  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
  });
  ChangePasswordModel copyWith({
    String? oldPassword,
    String? newPassword,
  }) {
    return ChangePasswordModel(
        oldPassword: oldPassword ?? this.oldPassword, newPassword: newPassword ?? this.newPassword);
  }

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      oldPassword: json[ChangePasswordFields.oldPassword] as String? ?? "",
      newPassword: json[ChangePasswordFields.newPassword] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson()=>{
    ChangePasswordFields.oldPassword: oldPassword,
    ChangePasswordFields.newPassword: newPassword
  };
}
