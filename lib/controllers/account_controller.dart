import 'package:get/get.dart';
import 'package:text_rpg_client/services/account_service.dart';
import 'package:text_rpg_client/services/server_service.dart';

import '../models/account_model.dart';
import '../models/response_model.dart';

class AccountController extends GetxController with StateMixin<AccountModel> {
  AccountController({
    required this.accountService,
    this.serverService,
  });

  AccountService accountService = AccountService();
  ServerService? serverService = ServerService();
  Rxn<DateTime> time = Rxn<DateTime>();

  @override
  void onInit() {
    _fetchServerTime();
    _fetchAccountDetail();
    super.onInit();
  }

  Future<void> _fetchAccountDetail() async {
    change(null, status: RxStatus.loading());
    await accountService.getDetail().then((result) {
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

  Future<void> _fetchServerTime() async {
    await serverService?.getTime().then((result) {
      time.value = DateTime.parse(result);
    }, onError: (dynamic error) {
      if (error is Map<String, dynamic>) {
        final ResponseModel response = ResponseModel.fromMap(error);
        change(null, status: RxStatus.error(response.message));
        return;
      }
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
