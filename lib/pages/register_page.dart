import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_rpg_client/widgets/app_bar_language.dart';

import '../controllers/register_controller.dart';
import '../enums/toast_enum.dart';
import '../models/register_model.dart';
import '../utils/functions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterModel register = RegisterModel();
    final RegisterController controller = Get.find<RegisterController>();

    Future<void> registerUser() async {
      final String? validate = register.validate();
      if (validate == null) {
        await controller.register(register);
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
                          onChanged: register.setUser,
                          validator: (value) => register.user.validate(),
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Usuário',
                            errorMaxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: register.setEmail,
                          validator: (value) => register.email.validate(),
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'E-mail',
                            errorMaxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(() {
                          return TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: register.setPassword,
                            validator: (value) => register.password.validate(),
                            keyboardType: TextInputType.name,
                            obscureText: controller.isObscuredPassword.value,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'Senha',
                              errorMaxLines: 2,
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.isObscuredPassword.value =
                                        !controller.isObscuredPassword.value,
                                icon: Icon(
                                  controller.isObscuredPassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        Obx(() {
                          return TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: register.setConfirmPassword,
                            validator: (value) => register.confirmPassword
                                .validate(register.password.value),
                            keyboardType: TextInputType.name,
                            obscureText:
                                controller.isObscuredConfirmPassword.value,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'Confirme a senha',
                              errorMaxLines: 3,
                              suffixIcon: IconButton(
                                onPressed: () => controller
                                        .isObscuredConfirmPassword.value =
                                    !controller.isObscuredConfirmPassword.value,
                                icon: Icon(
                                  controller.isObscuredConfirmPassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: const Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text: 'Ao criar uma conta você aceita todos os ',
                              children: [
                                TextSpan(
                                  text: 'Termos de Serviço e Regras',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: registerUser,
                          child: const Text('Registrar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
