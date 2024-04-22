import 'package:dio/dio.dart';
import 'package:poll_dao/src/features/widget_servers/loger_service/loger.dart';
import 'package:poll_dao/src/features/widget_servers/repositories/storage_repository.dart';

class BiometryRepository {
  Future<void> sendBiometryPassed() async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        'http://94.131.10.253:3000/settings/profile/pass-biometry',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'access-token': StorageRepository.getString("token"),
          },
        ),
      );
      if (response.statusCode == 200) {
        LoggerService.i('Biometry passed successfully sent');
      } else {
        LoggerService.w('Failed to vote. Status code: ${response.statusCode}');
        LoggerService.w('Reason: ${response.statusMessage}');
      }
    } catch (e) {
      LoggerService.e('Error occurred voteInPoll: $e');
    }
  }
}
