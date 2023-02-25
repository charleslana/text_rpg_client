import 'dart:async';

import 'package:get/get.dart';

import '../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offAllNamed<dynamic>(AppRoutes.landing),
    );
    super.onInit();
  }
}
