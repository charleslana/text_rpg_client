import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:text_rpg_client/routes/app_pages.dart';
import 'package:text_rpg_client/routes/app_routes.dart';
import 'package:text_rpg_client/services/auth_service.dart';
import 'package:text_rpg_client/services/language_service.dart';
import 'package:text_rpg_client/themes/theme_color.dart';

import 'i18n/i18n.dart';

void main() async {
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  await Get.putAsync(() => AuthService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text RPG Online',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: I18n.translationsKeys,
      locale: LanguageService.getLocale(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:
          I18n.languages.map((language) => language.locale).toList(),
    );
  }
}
