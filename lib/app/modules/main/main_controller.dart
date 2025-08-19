import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int i) => currentIndex.value = i;
}
