import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../services/register_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(RegisterService.new)
      ..lazyPut(
        () => RegisterController(
          registerService: Get.find<RegisterService>(),
        ),
      );
  }
}
