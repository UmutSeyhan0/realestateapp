import 'package:get/get.dart';
import 'package:realestateapp/app/modules/property/controllers/property_controller.dart';

class PropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(() => PropertyController());
  }
}
