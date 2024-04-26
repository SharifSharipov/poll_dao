import 'package:poll_dao/src/features/custom_sliver_example/data/models/topic_model.dart';

abstract class TopicRepository {
  Future<List<TopicModel>> getTopics();
}
