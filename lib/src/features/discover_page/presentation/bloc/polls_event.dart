part of 'polls_bloc.dart';

sealed class PollsBlocEvent extends Equatable {
  const PollsBlocEvent();

  @override
  List<Object> get props => [];
}

final class GetPolls extends PollsBlocEvent {}

final class GetPollsByCategory extends PollsBlocEvent {
  final int category;

  const GetPollsByCategory(this.category);

  @override
  List<Object> get props => [category];
}

//delete poll
final class DeletePoll extends PollsBlocEvent {
  final int pollId;

  const DeletePoll(this.pollId);

  @override
  List<Object> get props => [pollId];
}
