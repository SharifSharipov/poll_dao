part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
 final String statusText;
 final FormStatus status;
 final SignInModel signInModel;
 const SignInState({
  required this.statusText,
  required this.status,
  required this.signInModel,});
  SignInState copyWith({
    String? statusText,
    FormStatus? status,
    SignInModel? signInModel,
  }) {
    return SignInState(
      statusText: statusText ?? this.statusText,
      status: status ?? this.status,
      signInModel: signInModel ?? this.signInModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statusText,status,signInModel];
}