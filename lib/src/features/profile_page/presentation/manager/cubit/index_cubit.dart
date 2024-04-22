import 'package:bloc/bloc.dart';
class GlobalStateCubit extends Cubit<int> {
  GlobalStateCubit() : super(0);
  void updateValue(int newValue) => emit(newValue,);
}