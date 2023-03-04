import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:text_rpg_client/enums/gender_enum.dart';
import 'package:text_rpg_client/models/character_model.dart';
import 'package:text_rpg_client/models/new_character_model.dart';
import 'package:text_rpg_client/services/character_service.dart';

import '../enums/toast_enum.dart';
import '../models/response_model.dart';
import '../routes/app_routes.dart';
import '../services/account_character_service.dart';
import '../utils/functions.dart';

class NewCharacterController extends GetxController
    with StateMixin<List<CharacterModel>> {
  NewCharacterController({
    required this.accountCharactersService,
    required this.characterService,
  });

  AccountCharacterService accountCharactersService = AccountCharacterService();
  CharacterService characterService = CharacterService();

  final characterClassController = GroupButtonController();
  final genderController = GroupButtonController();

  Rxn<int> characterId = Rxn<int>();
  Rxn<String> characterDescription = Rxn<String>();
  Rx<GenderEnum> gender = Rx<GenderEnum>(GenderEnum.m);

  @override
  void onInit() {
    genderController.selectIndex(gender.value.index);
    _fetchAllCharacters();
    super.onInit();
  }

  void setCharacterId(int index, int id, String description) {
    characterClassController.selectIndex(index);
    characterId.value = id;
    characterDescription.value = description;
  }

  void setGender(int index) {
    gender.value = GenderEnum.values[index];
    genderController.selectIndex(index);
  }

  Future<void> _fetchAllCharacters() async {
    change(null, status: RxStatus.loading());
    await characterService.getAll().then((result) {
      change(result, status: RxStatus.success());
      characterId.value = result.first.id;
      characterDescription.value = result.first.description;
      characterClassController.selectIndex(0);
    }, onError: (dynamic error) {
      if (error is Map<String, dynamic>) {
        final ResponseModel response = ResponseModel.fromMap(error);
        change(null, status: RxStatus.error(response.message));
        return;
      }
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<void> create(NewCharacterModel newCharacter) async {
    closeKeyboard();
    showLoading();
    await accountCharactersService.createCharacter(newCharacter).then(
      (result) {
        Get.back<dynamic>();
        showToast(result.message, ToastEnum.success);
        replaceNavigate(AppRoutes.selectCharacter);
      },
      onError: (dynamic error) {
        Get.back<dynamic>();
        if (error is Map<String, dynamic>) {
          final ResponseModel response = ResponseModel.fromMap(error);
          showToast(response.message, ToastEnum.error);
          return;
        }
        showToast(error.toString(), ToastEnum.error);
      },
    );
  }
}
