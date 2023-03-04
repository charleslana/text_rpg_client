import 'package:get/get.dart';
import 'package:text_rpg_client/models/character_model.dart';
import 'package:text_rpg_client/services/request_service.dart';

class CharacterService extends RequestService {
  Future<List<CharacterModel>> getAll() async {
    final response = await get<dynamic>('/character');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return CharacterModel.listFromJson(response.body);
  }
}
