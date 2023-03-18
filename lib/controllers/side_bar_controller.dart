import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_rpg_client/models/account_character_model.dart';
import 'package:text_rpg_client/routes/app_routes.dart';
import 'package:text_rpg_client/services/account_character_service.dart';
import 'package:text_rpg_client/services/login_service.dart';
import 'package:text_rpg_client/utils/functions.dart';

import '../enums/toast_enum.dart';
import '../models/response_model.dart';

class SideBarController extends GetxController
    with StateMixin<AccountCharacterModel> {
  SideBarController({required this.accountCharacterService});

  AccountCharacterService accountCharacterService = AccountCharacterService();

  final GlobalKey<ScaffoldState> key = GlobalKey();
  final LoginService loginService = LoginService();

  @override
  void onInit() {
    _fetchAccountCharacterDetail();
    super.onInit();
  }

  void open() => key.currentState!.openDrawer();

  void close() => key.currentState!.closeDrawer();

  Future<void> _fetchAccountCharacterDetail() async {
    change(null, status: RxStatus.loading());
    await accountCharacterService.getDetail().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic error) {
      if (error is Map<String, dynamic>) {
        final ResponseModel response = ResponseModel.fromMap(error);
        change(null, status: RxStatus.error(response.message));
        return;
      }
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void logout() {
    loginService.removeLogin();
    replaceNavigate(AppRoutes.login);
  }

  void logoutCharacter() {
    accountCharacterService.logout().then(
      (_) => replaceNavigate(AppRoutes.selectCharacter),
      onError: (dynamic error) {
        if (error is Map<String, dynamic>) {
          final ResponseModel response = ResponseModel.fromMap(error);
          showToast(response.message, ToastEnum.error);
          return;
        }
        showToast(error, ToastEnum.error);
      },
    );
  }
}
