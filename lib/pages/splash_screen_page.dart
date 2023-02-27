import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';
import '../themes/text_style_theme.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              'Text RPG Online',
              style: getSonySketchEF().copyWith(fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
