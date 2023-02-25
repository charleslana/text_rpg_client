import 'dart:ui';

import 'package:get/get.dart';

import 'get_storage_service.dart';

class LanguageService {
  static final GetStorageService _getStorageService = GetStorageService();
  static const String _key = 'language';

  static Locale? getLocale() {
    final String? language = _getStorageService.read(_key);
    if (language == null) {
      return Get.deviceLocale;
    }
    return _splitLanguage(language);
  }

  void changeLocale(String language) {
    Get.updateLocale(_splitLanguage(language));
    _saveLocale(language);
  }

  String getLocaleString() {
    final String? language = _getStorageService.read(_key);
    if (language == null) {
      if (Get.deviceLocale == null) {
        return 'en-US';
      }
      return '${Get.deviceLocale!.languageCode}-${Get.deviceLocale!.countryCode}';
    }
    return language;
  }

  static Locale _splitLanguage(String language) {
    final languageSplit = language.split('-');
    return Locale(languageSplit[0], languageSplit[1]);
  }

  void _saveLocale(String language) {
    _getStorageService.save(_key, language);
  }
}
