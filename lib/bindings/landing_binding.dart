import 'package:get/get.dart';

import '../controllers/landing_controller.dart';
import '../services/landing_service.dart';
import '../services/login_service.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LandingService.new)
      ..lazyPut(
        () => LandingController(
          landingService: Get.find<LandingService>(),
          loginService: Get.find<LoginService>(),
        ),
      );
  }
}
