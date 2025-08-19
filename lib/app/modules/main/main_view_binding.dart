import 'package:get/get.dart';
import 'package:realestateapp/app/modules/home/bindings/home_binding.dart';
import 'package:realestateapp/app/modules/main/main_controller.dart';

class MainViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
