part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}
class SignInButtonPressed extends SignInEvent {}
class SingInErrorPressed extends SignInEvent {
  final String errorText;
  SingInErrorPressed({required this.errorText});
}
class SignInSuccessPressed extends SignInEvent {}
