import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/language_controller.dart';
import '../i18n/i18n.dart';
import '../i18n/language_model.dart';

class AppBarLanguage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarLanguage({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
        Get.find<LanguageController>();

    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: DropdownButtonHideUnderline(
        child: DropdownButton<LanguageModel>(
          value: languageController.selectedLanguage.value,
          items: I18n.languages
              .map(
                (item) => DropdownMenuItem<LanguageModel>(
                  value: item,
                  child: Text(
                    item.language,
                  ),
                ),
              )
              .toList(),
          onChanged: (LanguageModel? languageModel) =>
              languageController.changeLanguage(languageModel!),
        ),
      ),
    );
  }
}
