import 'package:get/get.dart';
import 'package:text_rpg_client/pages/home_page.dart';
import 'package:text_rpg_client/pages/new_character_page.dart';
import 'package:text_rpg_client/pages/select_character_page.dart';

import '../bindings/landing_binding.dart';
import '../bindings/language_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/register_binding.dart';
import '../bindings/splash_screen_binding.dart';
import '../guards/auth_guard.dart';
import '../pages/landing_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/splash_screen_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingPage(),
      bindings: [
        LandingBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      bindings: [
        LoginBinding(),
        LanguageBinding(),
      ],
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.selectCharacter,
      page: () => const SelectCharacterPage(),
      bindings: [
        // SelectCharacterBinding(),
        LoginBinding(),
      ],
      transition: Transition.leftToRight,
      middlewares: [
        AuthGuard(),
      ],
    ),
    GetPage(
      name: AppRoutes.newCharacter,
      page: () => const NewCharacterPage(),
      // binding: NewCharacterBinding(),
      transition: Transition.rightToLeft,
      middlewares: [
        AuthGuard(),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      // binding: HomeBinding(),
      transition: Transition.upToDown,
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}
