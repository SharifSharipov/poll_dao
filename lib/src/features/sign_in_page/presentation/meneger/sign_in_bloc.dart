import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/sign_in_page/data/models/sign_in_model.dart';
import 'package:poll_dao/src/features/sign_in_page/data/repositories/sign_in_repository.dart';
import 'package:poll_dao/src/features/widget_servers/status/status.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository signInRepository;

  SignInBloc({required this.signInRepository}) : super(const SignInState()) {
    on<SignInButtonPressed>(_signIn);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _signIn(SignInButtonPressed event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading....."));

    UniversalData universalData = await signInRepository.sendSignInRequest(
        email: emailController.text, password: passwordController.text);

    if (universalData.data != null){
      emit(state.copyWith(status: FormStatus.success, signInModel: universalData.data as SignInModel));
    } else {
      emit(state.copyWith(status: FormStatus.error, statusText: universalData.error));
    }
  }
}
