import 'package:flutter_bloc/flutter_bloc.dart';

//enum CounterEvent { increment, decrement }
class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
