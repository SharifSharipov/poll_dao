part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordEvent {}
class ChangePasswordPressed extends ChangePasswordEvent {
}
class ChangePasswordErrorPressed extends ChangePasswordEvent {
  final String errorText;
  ChangePasswordErrorPressed({required this.errorText});
}
class ChangePasswordSuccessPressed extends ChangePasswordEvent {}
