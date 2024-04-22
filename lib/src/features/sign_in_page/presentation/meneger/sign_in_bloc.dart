import 'package:equatable/equatable.dart';
import 'package:poll_dao/src/features/sign_in_page/data/models/sign_in_model.dart';
import 'package:poll_dao/src/features/sign_up_page/data/models/status.dart';
import 'package:poll_dao/src/features/sign_up_page/data/repositories/sign_up_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignUpRepository signUpRepository;
  SignInBloc(this.signUpRepository)
      : super(SignInState(
            statusText: '',
            status: FormStatus.pure,
            signInModel: SignInModel(email: '', password: ''))) {
    on<SignInButtonPressed>(_reRegister);
  }
  _reRegister(SignInButtonPressed event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading...."));
    // UniversalData universalData = await signUpRepository.sendSignUpRequest();
    // if (universalData.statusCode == 200) {
    //   emit(state.copyWith(status: FormStatus.success, statusText: "Success"));
    // } else {
    //   emit(state.copyWith(status: FormStatus.error, statusText: universalData.error));
    // }
  }

}
