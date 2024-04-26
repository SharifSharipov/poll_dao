import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/features/profile_page/data/models/change_password.dart';
import 'package:poll_dao/src/features/profile_page/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/widget_servers/status/status.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
 final ProfileRepository profileRepository;
  ChangePasswordBloc({required this.profileRepository}) : super(const ChangePasswordState()) {
    on<ChangePasswordPressed>(_changePassword);
  }
  final TextEditingController oldPasswordController= TextEditingController();
  final TextEditingController newPasswordController= TextEditingController();
  _changePassword(ChangePasswordPressed event, Emitter<ChangePasswordState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading....."));
    UniversalData universalData = await profileRepository.changePassword(
        oldPassword: oldPasswordController.text, newPassword: newPasswordController.text);
    if(universalData.data != null){
      emit(state.copyWith(status: FormStatus.success, changePasswordModel: universalData.data as ChangePasswordModel,statusText: universalData.data.message,));
    }else{
      emit(state.copyWith(status: FormStatus.error, statusText: universalData.error));
    }
  }
}
