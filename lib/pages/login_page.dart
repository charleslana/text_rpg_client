import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_rpg_client/routes/app_routes.dart';
import 'package:text_rpg_client/widgets/app_bar_language.dart';

import '../controllers/login_controller.dart';
import '../enums/toast_enum.dart';
import '../models/login_credential_model.dart';
import '../utils/functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginCredentialModel credential = LoginCredentialModel();
    final LoginController controller = Get.find<LoginController>();

    Future<void> login() async {
      final String? validate = credential.validate();
      if (validate == null) {
        await controller.login(credential);
        return;
      }
      showToast(validate, ToastEnum.error);
    }

    return SafeArea(
      child: Scaffold(
        appBar: const AppBarLanguage(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: credential.setUser,
                            validator: (value) => credential.user.validate(),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'login.page.input.user'.tr,
                              errorMaxLines: 2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(() {
                            return TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: credential.setPassword,
                              validator: (value) =>
                                  credential.password.validate(),
                              obscureText: controller.isObscured.value,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                labelText: 'login.page.input.password'.tr,
                                errorMaxLines: 2,
                                suffixIcon: IconButton(
                                  onPressed: () => controller.isObscured.value =
                                      !controller.isObscured.value,
                                  icon: Icon(
                                    controller.isObscured.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: login,
                            child: Text('login.page.button.login'.tr),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => navigate(AppRoutes.register),
                    child: Text('login.page.button.register'.tr),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: launchDiscord,
                    child: Text('login.page.button.discord'.tr),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
