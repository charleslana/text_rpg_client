import 'package:get/get.dart';

import '../enums/toast_enum.dart';
import '../models/register_model.dart';
import '../models/response_model.dart';
import '../routes/app_routes.dart';
import '../services/register_service.dart';
import '../utils/functions.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.registerService,
  });

  RegisterService registerService = RegisterService();
  RxBool isObscuredPassword = true.obs;
  RxBool isObscuredConfirmPassword = true.obs;

  Future<void> register(RegisterModel register) async {
    closeKeyboard();
    showLoading();
    await registerService.register(register).then(
      (result) {
        Get.back<dynamic>();
        showToast(result.message, ToastEnum.success);
        replaceNavigate(AppRoutes.login);
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
