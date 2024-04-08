part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  SignUpButtonPressed({required this.name, required this.email, required this.password});
}

class SignUpErrorPressed extends SignUpEvent {
  final String errorText;
  SignUpErrorPressed({required this.errorText});
}

class SignUpSuccessPressed extends SignUpEvent {}
