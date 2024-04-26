import 'package:poll_dao/src/features/profile_page/domain/service/service.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

class ProfileRepository {
  final Service apiService;

  ProfileRepository({required this.apiService});

  Future<UniversalData> fetchProfileData() async {
    final UniversalData universalData = await apiService.fetchProfileData();
    return UniversalData(data: universalData.data, error: universalData.error);
  }

  Future<UniversalData> putProfileData({
    required String name,
    required int age,
    required String gender,
    required String education,
    required String location,
    required String nationality,
  }) async {
    final UniversalData universalData = await apiService.putProfileData(
      location: location,
      age: age,
      name: name,
      education: education,
      gender: gender,
      nationality: nationality,
    );

    return UniversalData(data: universalData.data, error: universalData.error);
  }

  Future<UniversalData> changePassword({required String oldPassword, required String newPassword}) async {
    final UniversalData universalData =
        await apiService.sendProfileData(oldPassword: oldPassword, newPassword: newPassword);
    return UniversalData(data: universalData.data, error: universalData.error);
  }

  //delete account
  Future<void> deleteAccount() async => await apiService.deleteAccount();
}
