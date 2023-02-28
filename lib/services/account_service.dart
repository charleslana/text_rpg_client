import 'package:get/get.dart';
import 'package:text_rpg_client/models/account_model.dart';
import 'package:text_rpg_client/services/request_service.dart';

class AccountService extends RequestService {
  Future<AccountModel> getDetail() async {
    final response = await get<dynamic>('/account');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return AccountModel.fromMap(response.body);
  }
}
