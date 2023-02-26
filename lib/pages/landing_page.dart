import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/landing_controller.dart';
import '../utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController controller = Get.find<LandingController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Center(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.isLoading.value) ...[
                        const LinearProgressIndicator(),
                        const SizedBox(height: 10),
                      ],
                      Text(
                        controller.text.value,
                        textAlign: TextAlign.center,
                      ),
                      if (controller.isConnectionFailed.value) ...[
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => controller.tryAgain(),
                          child: Text('landing.page.button'.tr),
                        ),
                      ],
                    ],
                  );
                }),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'By Charles Lana',
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'v.$appVersion',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
