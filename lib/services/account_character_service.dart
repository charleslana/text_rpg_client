import 'package:get/get.dart';
import 'package:text_rpg_client/models/account_character_model.dart';
import 'package:text_rpg_client/services/request_service.dart';

import '../models/response_model.dart';

class AccountCharacterService extends RequestService {
  Future<List<AccountCharacterModel>> getAll() async {
    final response = await get<dynamic>('/account/character');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return AccountCharacterModel.listFromJson(response.body);
  }

  Future<ResponseModel> deleteCharacter(int id) async {
    final response = await delete<dynamic>('/account/character/$id');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return ResponseModel.fromMap(response.body);
  }
}
