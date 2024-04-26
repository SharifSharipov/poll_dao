part of 'polls_bloc.dart';

sealed class PollsState extends Equatable {
  const PollsState();

  @override
  List<Object> get props => [];
}

final class PollsBlocInitial extends PollsState {}

final class PollsBlocLoading extends PollsState {}

final class PollsBlocLoaded extends PollsState {
  final List<Poll> polls;

  const PollsBlocLoaded(this.polls);

  @override
  List<Object> get props => [polls];
}

final class PollsError extends PollsState {
  final String message;

  const PollsError(this.message);

  @override
  List<Object> get props => [message];
}
