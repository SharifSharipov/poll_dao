part of 'sign_in_bloc.dart';

@immutable
class SignInState extends Equatable {
  final FormStatus? status;
  final String? statusText;
  final SignInModel? signInModel;
  SignInState({this.status = FormStatus.pure, this.statusText, this.signInModel});

  SignInState copyWith({FormStatus? status, String? statusText, SignInModel? signInModel}) {
    return SignInState(
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      signInModel: signInModel ?? this.signInModel,
    );
  }
  @override
  List<Object?> get props => [status, statusText, signInModel];
}
