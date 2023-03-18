import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:text_rpg_client/controllers/side_bar_controller.dart';
import 'package:text_rpg_client/models/account_character_model.dart';
import 'package:text_rpg_client/routes/app_routes.dart';
import 'package:text_rpg_client/utils/functions.dart';

class SideBar extends GetView<SideBarController> {
  const SideBar({Key? key}) : super(key: key);

  void _logout() {
    back();
    controller.logout();
  }

  void _logoutCharacter() {
    back();
    controller.logoutCharacter();
  }

  void _profile() {
    back();
    replaceNavigate(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          controller.obx(
            (state) {
              final accountCharacter = state as AccountCharacterModel;
              return UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    accountCharacter.character.characterClass,
                    textAlign: TextAlign.center,
                  ),
                ),
                accountName: Text(accountCharacter.name),
                accountEmail: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nível: ${accountCharacter.level}'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: JustTheTooltip(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        isModal: true,
                        content: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                              'Alzes: ${decimalNumberFormat(accountCharacter.alz)}'),
                        ),
                        child: Text(
                            'Alzes: ${numberAbbreviation(accountCharacter.alz)}'),
                      ),
                    ),
                  ],
                ),
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
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: _profile,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Trocar de personagem'),
            onTap: _logoutCharacter,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Deslogar da conta'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
