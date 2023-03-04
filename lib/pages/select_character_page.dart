import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:text_rpg_client/controllers/account_controller.dart';
import 'package:text_rpg_client/controllers/select_character_controller.dart';
import 'package:text_rpg_client/models/account_character_model.dart';
import 'package:text_rpg_client/models/account_model.dart';
import 'package:text_rpg_client/routes/app_routes.dart';
import 'package:text_rpg_client/widgets/clock.dart';
import 'package:text_rpg_client/widgets/custom_app_bar.dart';

import '../controllers/login_controller.dart';
import '../services/language_service.dart';
import '../utils/functions.dart';

class SelectCharacterPage extends StatelessWidget {
  const SelectCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    final SelectCharacterController selectCharacterController =
        Get.find<SelectCharacterController>();
    final AccountController accountController = Get.find<AccountController>();

    void delete(VoidCallback callback) {
      showConfirmation(callback);
    }

    DateTime accountPremiumDate = DateTime.now();

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Personagens',
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: loginController.logout,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                accountController.obx(
                  (state) {
                    final account = state as AccountModel;
                    final DateFormat formatter =
                        DateFormat.yMd(LanguageService().getLocaleString())
                            .add_jm();
                    final premiumDate = account.premiumDate as DateTime;
                    accountPremiumDate = premiumDate;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.timer),
                            Clock(dateTime: accountController.time.value),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Bem vindo(a) '),
                              TextSpan(
                                text: '${account.user}!',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Conta premium expira em: ${formatter.format(premiumDate)}',
                                style:
                                    const TextStyle(color: Colors.lightGreen),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (premiumDate.isBefore(DateTime.now())) ...[
                              const Expanded(
                                child: Chip(
                                  backgroundColor: Colors.redAccent,
                                  label: Text(
                                    'Expirado',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ] else ...[
                              const Expanded(
                                child: Chip(
                                  backgroundColor: Colors.lightGreen,
                                  label: Text(
                                    'Ativo',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ],
                    );
                  },
                  onEmpty: const Center(
                    child: Text('empty'),
                  ),
                  onError: (error) => Center(
                    child: Text(error.toString()),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(height: 20),
                selectCharacterController.obx(
                  (state) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        if (state!.length > index) {
                          final AccountCharacterModel accountCharacterModel =
                              state[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(accountCharacterModel
                                        .character.characterClass),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () => delete(() =>
                                          selectCharacterController
                                              .deleteCharacter(
                                                  accountCharacterModel.id)),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(accountCharacterModel.name),
                                        const SizedBox(height: 5),
                                        Text(
                                            'Nível ${accountCharacterModel.level}'),
                                        const SizedBox(height: 5),
                                        ElevatedButton(
                                          onPressed: () => {},
                                          child: const Text('Jogar'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          if (index >= 4 &&
                              accountPremiumDate.isBefore(
                                  accountController.time.value as DateTime)) {
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.lock,
                                    size: 50,
                                  ),
                                  SizedBox(height: 5),
                                  Text('Requer conta premium'),
                                ],
                              ),
                            );
                          } else {
                            return Card(
                              child: IconButton(
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  Icons.person_add,
                                  size: 50,
                                ),
                                onPressed: () =>
                                    navigate(AppRoutes.newCharacter),
                              ),
                            );
                          }
                        }
                      },
                    );
                  },
                  onEmpty: const Center(
                    child: Text('empty'),
                  ),
                  onError: (error) => Center(
                    child: Text(error.toString()),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
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
