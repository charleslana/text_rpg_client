import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/account_character_controller.dart';
import 'package:text_rpg_client/services/account_character_service.dart';

class AccountCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(AccountCharacterService.new)
      ..lazyPut(
        () => AccountCharacterController(
          accountCharactersService: Get.find<AccountCharacterService>(),
        ),
      );
  }
}
