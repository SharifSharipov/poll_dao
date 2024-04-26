import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget_servers/repositories/storage_repository.dart';
import '../../data/models/poll_model.dart';

part 'polls_event.dart';
part 'polls_state.dart';

class PollsBloc extends Bloc<PollsBlocEvent, PollsState> {
  PollsBloc()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://94.131.10.253:3000',
            headers: {"access-token": StorageRepository.getString("token")},
          ),
        ),
        super(PollsBlocInitial()) {
    on<GetPolls>(_getPolls);
    on<GetPollsByCategory>(_getPollsByCategory);
    on<DeletePoll>(_deletePoll);
  }

  final Dio _dio;

  FutureOr<void> _getPolls(GetPolls event, Emitter<PollsState> emit) async {
    try {
      emit(PollsBlocLoading());
      var response = await _dio.get('/public/polls');
      final List<dynamic> jsonData = response.data;

      final List<Poll> polls = jsonData.map((json) => Poll.fromJson(json)).toList().reversed.toList();
      emit(PollsBlocLoaded(polls));
    } catch (e) {
      emit(PollsError(e.toString()));
    }
  }

  FutureOr<void> _getPollsByCategory(GetPollsByCategory event, Emitter<PollsState> emit) async {
    try {
      emit(PollsBlocLoading());
      var response = await _dio.get(
        '/public/polls/',
        queryParameters: {'topic': event.category},
      );
      final List<dynamic> jsonData = response.data;
      final List<Poll> polls = jsonData.map((json) => Poll.fromJson(json)).toList().reversed.toList();
      emit(PollsBlocLoaded(polls));
    } catch (e) {
      emit(PollsError(e.toString()));
    }
  }

  FutureOr<void> _deletePoll(DeletePoll event, Emitter<PollsState> emit) async{
    try {
      emit(PollsBlocLoading());
      await _dio.delete('/poll/delete/${event.pollId}');
      add(GetPolls());
    } catch (e) {
      emit(PollsError(e.toString()));
    }
  }
}
