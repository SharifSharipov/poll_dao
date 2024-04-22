import 'package:poll_dao/src/features/discover_page/domain/service/service.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

class DiscoverRepository {
  final Service apiService;
  DiscoverRepository({required this.apiService});
  Future<UniversalData> fetchData() async {
    final UniversalData universalData = await apiService.fetchData();
    return UniversalData(data: universalData.data, error: universalData.error);
  }
}
