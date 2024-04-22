part of 'fetch_profile_data_bloc.dart';

@immutable
class FetchProfileDataState extends Equatable {
  final String? statusText;
  final FormStatus? status;
  final ProfileModel profileModel;
  final ChangePasswordModel? changePasswordModel;

  const FetchProfileDataState({
    this.status = FormStatus.pure,
    this.statusText,
    required this.profileModel,
    this.changePasswordModel,
  });

  FetchProfileDataState copyWith(
      {FormStatus? status, String? statusText, ProfileModel? profileModel, ChangePasswordModel? changePasswordModel}) {
    return FetchProfileDataState(
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      profileModel: profileModel ?? this.profileModel,
      changePasswordModel: changePasswordModel ?? this.changePasswordModel,
    );
  }

  @override
  List<Object?> get props => [statusText, status, profileModel, changePasswordModel];
}
