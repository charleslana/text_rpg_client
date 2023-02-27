import 'package:get/get.dart';

import '../models/login_credential_model.dart';
import '../utils/constants.dart';
import 'encrypt_service.dart';
import 'login_service.dart';

class RequestService extends GetConnect {
  final EncryptService _encryptService = EncryptService();
  final LoginCredentialModel _credential = LoginCredentialModel();

  final LoginService _loginService = Get.put(LoginService());

  @override
  void onInit() {
    httpClient
      ..baseUrl = apiBaseUrl
      ..addAuthenticator<dynamic>((request) async {
        final Map<String, dynamic>? getLoginStorage = _loginService.readLogin();
        if (getLoginStorage != null) {
          _credential
            ..fromMap(getLoginStorage)
            ..setUser(_encryptService.decrypt(_credential.user.value))
            ..setPassword(_encryptService.decrypt(_credential.password.value));
          final result = await _loginService.login(_credential);
          _loginService.saveAuth(result);
        }
        return request;
      })
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['Authorization'] =
            'Bearer ${_loginService.getAuth().accessToken}';
        request.headers['cookie'] = _loginService.getAuth().cookie;
        return request;
      })
      ..maxAuthRetries = 2;
    super.onInit();
  }
}
