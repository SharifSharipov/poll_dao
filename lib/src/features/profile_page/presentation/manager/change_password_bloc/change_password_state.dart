part of 'change_password_bloc.dart';

@immutable
 class ChangePasswordState extends Equatable {
  final String? statusText;
  final FormStatus? status;
  final ChangePasswordModel? changePasswordModel;
  ChangePasswordState({this.status = FormStatus.pure, this.statusText, this.changePasswordModel});
  ChangePasswordState copyWith({FormStatus? status, String? statusText, ChangePasswordModel? changePasswordModel}) {
    return ChangePasswordState(
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      changePasswordModel: changePasswordModel ?? this.changePasswordModel,
    );
  }
  @override
  List<Object?> get props => [statusText,status,changePasswordModel];
}

