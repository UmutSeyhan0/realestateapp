import 'package:get/get.dart';
import '../controllers/saved_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}
