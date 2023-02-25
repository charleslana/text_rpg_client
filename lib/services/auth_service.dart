import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  RxBool isAuthenticated = false.obs;
}