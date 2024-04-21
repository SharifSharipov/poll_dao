
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/sign_in_page/data/models/universaldata.dart';
import 'package:poll_dao/src/features/sign_up_page/data/models/status.dart';
import 'package:poll_dao/src/features/sign_up_page/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/sign_up_repository.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpBloc(this.signUpRepository) : super(const SignUpState()) {
    on<SignUpButtonPressed>(_reRegister);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void _reRegister(SignUpButtonPressed event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
// await Future.delayed(const Duration(seconds: 3), () {
//   emit(state.copyWith(status: FormStatus.error, statusText: "Error"));
// });
    UniversalData universalData = await signUpRepository.sendSignUpRequest(
        email: emailController.text, password: passwordController.text, name: nameController.text);
    if (universalData.data != null) {
      emit(state.copyWith(status: FormStatus.success, userModel: universalData.data as UserModel));
    } else {
      emit(state.copyWith(status: FormStatus.error, statusText: universalData.error));
    }
  }
}
