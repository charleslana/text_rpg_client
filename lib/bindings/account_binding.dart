import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/account_controller.dart';
import 'package:text_rpg_client/services/account_service.dart';
import 'package:text_rpg_client/services/server_service.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(AccountService.new)
      ..lazyPut(
        () => AccountController(
          accountService: Get.find<AccountService>(),
          serverService: Get.find<ServerService>(),
        ),
      );
  }
}
