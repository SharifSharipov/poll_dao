part of 'sign_up_bloc.dart';

@immutable
class SignUpState extends Equatable {
  final String? statusText;
  final FormStatus status;
  final UserModel? userModel;

  const SignUpState({
    this.statusText,
    this.status = FormStatus.pure,
    this.userModel,
  });

  SignUpState copyWith({
    String? statusText,
    FormStatus? status,
    UserModel? userModel,
  }) {
    return SignUpState(
      statusText: statusText ?? this.statusText,
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [statusText, status, userModel];
}
