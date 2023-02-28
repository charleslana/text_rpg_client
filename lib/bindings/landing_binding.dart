import 'package:get/get.dart';

import '../controllers/landing_controller.dart';
import '../services/login_service.dart';
import '../services/server_service.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(ServerService.new)
      ..lazyPut(
        () => LandingController(
          serverService: Get.find<ServerService>(),
          loginService: Get.find<LoginService>(),
        ),
      );
  }
}
