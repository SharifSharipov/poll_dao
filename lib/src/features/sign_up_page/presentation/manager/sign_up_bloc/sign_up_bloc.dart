import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poll_dao/src/features/sign_up_page/data/models/universaldata.dart';
import 'package:poll_dao/src/features/sign_up_page/data/models/user_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState(errorText: '', data: UniversalData(), userModel:UserModel(name: '', email: '', password: ''))) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
