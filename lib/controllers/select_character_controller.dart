import 'package:get/get.dart';

import '../enums/toast_enum.dart';
import '../models/account_character_model.dart';
import '../models/response_model.dart';
import '../routes/app_routes.dart';
import '../services/account_character_service.dart';
import '../utils/functions.dart';

class SelectCharacterController extends GetxController
    with StateMixin<List<AccountCharacterModel>> {
  SelectCharacterController({
    required this.accountCharactersService,
  });

  AccountCharacterService accountCharactersService = AccountCharacterService();

  @override
  void onInit() {
    _fetchAllCharacters();
    super.onInit();
  }

  Future<void> _fetchAllCharacters() async {
    change(null, status: RxStatus.loading());
    await accountCharactersService.getAll().then((result) {
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

  Future<void> deleteCharacter(int id) async {
    showLoading();
    await accountCharactersService.deleteCharacter(id).then(
      (result) {
        Get.back<dynamic>();
        showToast(result.message, ToastEnum.success);
        _fetchAllCharacters();
      },
      onError: (dynamic error) {
        Get.back<dynamic>();
        if (error is Map<String, dynamic>) {
          final ResponseModel response = ResponseModel.fromMap(error);
          showToast(response.message, ToastEnum.error);
          return;
        }
        showToast(error, ToastEnum.error);
      },
    );
  }

  Future<void> selectCharacter(int id) async {
    showLoading();
    await accountCharactersService.selectCharacter(id).then(
      (result) {
        replaceNavigate(AppRoutes.home);
      },
      onError: (dynamic error) {
        Get.back<dynamic>();
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
