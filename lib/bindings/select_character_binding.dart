import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/select_character_controller.dart';
import 'package:text_rpg_client/services/account_character_service.dart';

class SelectCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(AccountCharacterService.new)
      ..lazyPut(
        () => SelectCharacterController(
          accountCharactersService: Get.find<AccountCharacterService>(),
        ),
      );
  }
}
