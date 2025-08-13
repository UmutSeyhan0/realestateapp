import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  // Add any state variables or methods needed for the home screen here
  // For example, lists of brands or popular cars could be managed here.

  final RxInt selectedBottomNavIndex = 0.obs;

  void changeBottomNavIndex(int index) {
    selectedBottomNavIndex.value = index;
  }

  // Dummy data - replace with actual data source
  final List<Map<String, dynamic>> brands = [
    {'name': 'Mercedes', 'logo': 'assets/icons/mercedes_logo.png', 'color': const Color(0xFFFDEEF0)},
    {'name': 'BMW', 'logo': 'assets/icons/bmw_logo.png', 'color': const Color(0xFFE6F3E9)},
    {'name': 'Chevrolet', 'logo': 'assets/icons/chevrolet_logo.png', 'color': const Color(0xFFE3F2FD)},
  ];

  final List<Map<String, String>> popularCars = [
    {
      'name': 'Tesla Model S 2020',
      'price': '\$300',
      'image': 'assets/images/tesla_model_s.png'
    },
    {
      'name': 'Tesla Model X',
      'price': '\$350',
      'image': 'assets/images/tesla_model_x.png' 
    },
  ];

  @override
  void onInit() {
    super.onInit();
    // Fetch initial data here
  }
} 