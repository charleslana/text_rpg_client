import 'package:get/get.dart';

import '../models/auth_model.dart';
import '../models/login_credential_model.dart';
import '../utils/constants.dart';
import 'encrypt_service.dart';
import 'get_storage_service.dart';

class LoginService extends GetConnect {
  final String _loginKey = 'login';
  final String _authKey = 'auth';

  final GetStorageService _getStorageService = GetStorageService();
  final EncryptService _encryptService = EncryptService();

  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
    super.onInit();
  }

  AuthModel getAuth() => AuthModel.fromMap(_readAuth()!);

  Future<AuthModel> login(LoginCredentialModel credential) async {
    final response = await post<dynamic>('/account/login', {
      'user': credential.user.value,
      'password': credential.password.value,
    });
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return AuthModel.fromMap(response.body)
        .copyWith(cookie: _getCookieFromHeader(response));
  }

  Map<String, dynamic>? readLogin() => _getStorageService.read(_loginKey);

  void removeAuth() => _getStorageService.remove(_authKey);

  void removeLogin() => _getStorageService.remove(_loginKey);

  void saveAuth(AuthModel auth) =>
      _getStorageService.save(_authKey, auth.toMap());

  void saveLogin(LoginCredentialModel credential) {
    credential
      ..setUser(_encryptService.encrypt(credential.user.value))
      ..setPassword(_encryptService.encrypt(credential.password.value));
    _getStorageService.save(_loginKey, credential.toMap());
  }

  String _getCookieFromHeader(Response<dynamic> response) {
    final String? rawCookie = response.headers!['set-cookie'];
    if (rawCookie != null) {
      final int index = rawCookie.indexOf(';');
      return (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
    return '';
  }

  Map<String, dynamic>? _readAuth() => _getStorageService.read(_authKey);
}
