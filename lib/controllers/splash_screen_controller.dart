import 'dart:async';

import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../utils/functions.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => replaceNavigate(AppRoutes.landing),
    );
    super.onInit();
  }
}
