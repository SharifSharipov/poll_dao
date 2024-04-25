import 'package:poll_dao/src/features/create_poll/domain/service/service.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

class CreatePollRepository {
  final Service apiService;
  CreatePollRepository({required this.apiService});
  Future<UniversalData> sendPollRequest(
      {required int id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String name,
      required int topic,
      required int author,
      required bool archived}) async {
    final UniversalData universalData = await apiService.sendPollRequest(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        name: name,
        topic: topic,
        author: author,
        archived: archived);
    return UniversalData(data: universalData.data, error: universalData.error);
  }
}
