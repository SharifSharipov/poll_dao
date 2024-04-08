part of 'sign_up_bloc.dart';

@immutable
class SignUpState extends Equatable {
  final String errorText;
  final UniversalData data;
  final UserModel userModel;
  SignUpState({required this.errorText, required this.data, required this.userModel});

  SignUpState copyWith({
    String? errorText,
    UniversalData? data,
    UserModel? userModel,
  }) {
    return SignUpState(
      errorText: errorText ?? this.errorText,
      data: data ?? this.data,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [errorText, data, userModel];
}
