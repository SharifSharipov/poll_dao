import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/features/custom_sliver_example/data/models/topic_model.dart';
import 'package:poll_dao/src/features/topics/domain/topic_repository.dart';

class TopicNotifier extends ChangeNotifier {
  TopicNotifier(this._repository);
  final TopicRepository _repository;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<TopicModel> _topics = [];
  List<TopicModel> get topics => _topics;

  Future<void> getTopics() async {
    _isLoading = true;
    notifyListeners();
    _topics = await _repository.getTopics();
    _isLoading = false;
    notifyListeners();
  }
}
