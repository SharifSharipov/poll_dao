part of 'fetch_profile_data_bloc.dart';

@immutable
sealed class FetchProfileDataEvent {}

class FetchProfileData extends FetchProfileDataEvent {}

class FetchProfileDataError extends FetchProfileDataEvent {
  final String errorText;
  FetchProfileDataError({required this.errorText});
}
class UpdateProfilePressed extends FetchProfileDataEvent {

}
class UpdateProfileErrorPressed extends FetchProfileDataEvent {
  final String errorText;
  UpdateProfileErrorPressed({required this.errorText});
}

class ChangePasswordPressed extends FetchProfileDataEvent {}

class ChangePasswordErrorPressed extends FetchProfileDataEvent {
  final String errorText;
  ChangePasswordErrorPressed({required this.errorText});
}

class FetchProfileDataSuccess extends FetchProfileDataEvent {}

class UpdateLocation extends FetchProfileDataEvent {
  final String location;
  UpdateLocation({required this.location});
}
class UpdateAge extends FetchProfileDataEvent {
  final int age;
  UpdateAge({required this.age});
}
class UpdateName extends FetchProfileDataEvent {
  final String name;
  UpdateName({required this.name});
}
class UpdateEducation extends FetchProfileDataEvent {
  final String education;
  UpdateEducation({required this.education});
}
class UpdateNationality extends FetchProfileDataEvent {
  final String nationality;
  UpdateNationality({required this.nationality});
}