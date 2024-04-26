import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poll_dao/src/features/profile_page/data/models/change_password.dart';
import 'package:poll_dao/src/features/profile_page/data/models/profile_model.dart';
import 'package:poll_dao/src/features/profile_page/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/widget_servers/status/status.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

import '../../../../widget_servers/repositories/storage_repository.dart';

part 'fetch_profile_data_event.dart';
part 'fetch_profile_data_state.dart';

class FetchProfileDataBloc extends Bloc<FetchProfileDataEvent, FetchProfileDataState> {
  final ProfileRepository profileRepository;

  FetchProfileDataBloc({required this.profileRepository})
      : super(FetchProfileDataState(profileModel: ProfileModel.empty())) {
    on<FetchProfileData>(_fetchProfileData);
    on<UpdateProfilePressed>(_updateProfile);
    on<ChangePasswordPressed>(_changePassword);
    on<UpdateLocation>(_updateLocation);
    on<UpdateAge>(_updateAge);
    on<UpdateName>(_updateName);
    on<UpdateEducation>(_updateEducation);
    on<UpdateNationality>(_updateNationality);
    on<DeleteAccountEvent>(_deleteAccount);
    on<SignOutEvent>(_signOut);
    on<UpdateGender>(_updateGender);
  }

  final String locationController = "";
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final String educationController = "";
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  _fetchProfileData(FetchProfileData event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading....."));
    UniversalData universalData = await profileRepository.fetchProfileData();
    if (universalData.data != null) {
      //fill controllers
      nameController.text = universalData.data!.name;
      ageController.text = universalData.data!.age.toString();

      emit(state.copyWith(
        status: FormStatus.success,
        profileModel: universalData.data as ProfileModel?,
        statusText: universalData.error,
      ));
    } else {
      emit(state.copyWith(status: FormStatus.error, statusText: universalData.error));
    }
  }

  _updateLocation(UpdateLocation event, Emitter<FetchProfileDataState> emit) async {
    // print(event.location);
    emit(state.copyWith(profileModel: state.profileModel.copyWith(location: event.location)));
    //print(state.profileModel?.location);
  }

  _updateAge(UpdateAge event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(profileModel: state.profileModel.copyWith(age: event.age)));
  }

  _updateName(UpdateName event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(profileModel: state.profileModel.copyWith(name: event.name)));
  }

  _updateEducation(UpdateEducation event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(profileModel: state.profileModel.copyWith(education: event.education)));
  }

  _updateNationality(UpdateNationality event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(profileModel: state.profileModel.copyWith(nationality: event.nationality)));
  }

  _updateProfile(UpdateProfilePressed event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading....."));
    UniversalData universalData = await profileRepository.putProfileData(
        location: state.profileModel.location,
        age: int.tryParse(ageController.text) ?? 0,
        name: nameController.text,
        education: state.profileModel.education,
        gender: state.profileModel.gender,
        nationality: state.profileModel.nationality);
    emit(
      state.copyWith(
        status: FormStatus.success,
        profileModel: universalData.data as ProfileModel?,
        statusText: universalData.error,
      ),
    );
  }

  _changePassword(ChangePasswordPressed event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading....."));
    UniversalData universalData = await profileRepository.changePassword(
        oldPassword: oldPasswordController.text, newPassword: newPasswordController.text);
    if (universalData.data != null) {
      emit(state.copyWith(
        status: FormStatus.success,
        changePasswordModel: universalData.data as ChangePasswordModel?,
        statusText: universalData.error,
      ));
    } else {
      emit(state.copyWith(status: FormStatus.error, statusText: universalData.error));
    }
  }

  FutureOr<void> _deleteAccount(DeleteAccountEvent event, Emitter<FetchProfileDataState> emit) async {
    try {
      emit(state.copyWith(status: FormStatus.loading, statusText: "Loading....."));
      await profileRepository.deleteAccount();
      StorageRepository.deleteString('token');
    } on DioException catch (e) {
      emit(state.copyWith(status: FormStatus.error, statusText: e.message ?? "Error deleting account"));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error, statusText: e.toString()));
    }
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<FetchProfileDataState> emit) async {
    StorageRepository.deleteString('token');
    emit(state.copyWith(status: FormStatus.pure, statusText: "Sign out"));
  }

  FutureOr<void> _updateGender(UpdateGender event, Emitter<FetchProfileDataState> emit) async {
    emit(state.copyWith(profileModel: state.profileModel.copyWith(gender: event.gender)));
  }
}
