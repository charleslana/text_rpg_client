import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/new_character_controller.dart';
import 'package:text_rpg_client/services/account_character_service.dart';
import 'package:text_rpg_client/services/character_service.dart';

class NewCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(AccountCharacterService.new)
      ..lazyPut(CharacterService.new)
      ..lazyPut(
        () => NewCharacterController(
          accountCharactersService: Get.find<AccountCharacterService>(),
          characterService: Get.find<CharacterService>(),
        ),
      );
  }
}
