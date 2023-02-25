import 'package:get/get.dart';

import '../models/register_model.dart';
import '../models/response_model.dart';
import '../utils/constants.dart';
import 'language_service.dart';

class RegisterService extends GetConnect {
  final LanguageService _languageService = LanguageService();

  @override
  void onInit() {
    httpClient
      ..baseUrl = apiBaseUrl
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = _languageService.getLocaleString();
        return request;
      });
    super.onInit();
  }

  Future<ResponseModel> register(RegisterModel register) async {
    final response = await post<dynamic>('/account', register.toMap());
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return ResponseModel.fromMap(response.body);
  }
}
