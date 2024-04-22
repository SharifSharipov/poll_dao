part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {

}

class SignUpErrorPressed extends SignUpEvent {
  final String errorText;
  SignUpErrorPressed({required this.errorText});
}

class SignUpSuccessPressed extends SignUpEvent {}
