import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:realestateapp/app/modules/auth/views/login_view.dart';
import 'package:realestateapp/app/modules/onboarding/bindings/onboarding_binding.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';
import 'navigation_constants.dart';

class NavigationService {
  static List<GetPage> routes = [
    GetPage(
      name: NavigationConstants.onboardView,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: NavigationConstants.loginView,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: NavigationConstants.registerView,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
  ];
}
