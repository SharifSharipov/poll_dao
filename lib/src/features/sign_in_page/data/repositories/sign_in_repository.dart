import 'package:poll_dao/src/features/sign_in_page/domain/service/service.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

class SignInRepository {
  final Service apiService;
  SignInRepository({required this.apiService});
  Future<UniversalData> sendSignInRequest({required String email, required String password}) async {
    final UniversalData universalData =
        await apiService.sendLoginRequest(email: email, password: password);
    return UniversalData(data: universalData.data, error: universalData.error);
  }
}
