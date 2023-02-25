import 'package:get_storage/get_storage.dart';

class GetStorageService {
  final GetStorage _getStorage = GetStorage();

  dynamic read(dynamic key) {
    return _getStorage.read<dynamic>(key);
  }

  void remove(String key) {
    _getStorage.remove(key);
  }

  void save(String key, dynamic value) {
    _getStorage.write(key, value);
  }
}
