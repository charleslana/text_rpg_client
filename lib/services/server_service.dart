import 'package:get/get.dart';

import '../utils/constants.dart';

class ServerService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
    super.onInit();
  }

  Future<String> getVersion() async {
    final response = await get<dynamic>('/server/version');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }

  Future<String> getTime() async {
    final response = await get<dynamic>('/server/time');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }
}
