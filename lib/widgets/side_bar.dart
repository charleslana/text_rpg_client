import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/side_bar_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountEmail: Text("user@mail.com"),
            accountName: Text("Seu zé"),
            currentAccountPicture: CircleAvatar(
              child: Text("SZ"),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Minha conta'),
            onTap: back,
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
