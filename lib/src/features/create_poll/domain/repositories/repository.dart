import 'package:poll_dao/src/features/create_poll/data/models/option_model.dart';
import 'package:poll_dao/src/features/create_poll/domain/service/service.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

class CreatePollRepository {
  final CreatePollApiService apiService = const CreatePollApiService();
  const CreatePollRepository();

  Future<UniversalData> sendPollRequest({
    required String name,
    required int topic,
    required List<OptionModel> options,
    String? location,
    String? education,
    String? nationality,
    bool? biometryPassed,
    int? minAge,
    int? maxAge,
    String? gender,
    String? maternalLang,
  }) async {
    final UniversalData universalData = await apiService.sendPollRequest(
      name: name,
      topic: topic,
      options: options,
      location: location,
      biometryPassed: biometryPassed,
      minAge: minAge,
      maxAge: maxAge,
      education: education,
      nationality: nationality,
      maternalLang: maternalLang,
      gender: gender,
    );
    return UniversalData(data: universalData.data, error: universalData.error);
  }
}
