import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

import '../../domain/service/service.dart';

class SignUpRepository {
  final ApiService apiService;

  SignUpRepository({required this.apiService});

  Future<UniversalData> sendSignUpRequest({
    required String email,
    required String password,
    required String name,
  }) async {
    final UniversalData universalData = await apiService.sendSignUpRequest(
      email: email,
      password: password,
      name: name,
    );
    return UniversalData(data: universalData.data, error: universalData.error);
  }
}
