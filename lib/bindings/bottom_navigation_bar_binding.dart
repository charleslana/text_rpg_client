import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/bottom_navigation_bar_controller.dart';
import 'package:text_rpg_client/controllers/side_bar_controller.dart';
import 'package:text_rpg_client/services/account_character_service.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(BottomNavigationBarController.new)
      ..lazyPut(
        () => SideBarController(
          accountCharacterService: Get.find<AccountCharacterService>(),
        ),
      );
  }
}
