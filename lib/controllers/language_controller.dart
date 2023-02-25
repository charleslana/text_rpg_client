import 'package:get/get.dart';

import '../i18n/i18n.dart';
import '../i18n/language_model.dart';
import '../services/language_service.dart';

class LanguageController extends GetxController {
  final Rxn<LanguageModel> selectedLanguage = Rxn<LanguageModel>();
  final LanguageService languageService = LanguageService();

  @override
  void onInit() {
    selectedLanguage.value = I18n.languages
        .where((language) =>
            language.language == languageService.getLocaleString())
        .toList()
        .first;
    super.onInit();
  }

  void changeLanguage(LanguageModel languageModel) {
    if (languageModel.locale != selectedLanguage.value!.locale) {
      selectedLanguage.value = languageModel;
      languageService.changeLocale(languageModel.language);
    }
  }
}
