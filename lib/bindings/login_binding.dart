import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../services/login_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LoginService.new)
      ..lazyPut(
        () => LoginController(
          loginService: Get.find<LoginService>(),
        ),
      );
  }
}
