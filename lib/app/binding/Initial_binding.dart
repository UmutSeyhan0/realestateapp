import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_screen.dart';
import '../routes/navigation_constants.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {}

  static final routes = [
    GetPage(
      name: NavigationConstants.homeView,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
