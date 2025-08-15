import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var properties = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProperties();
  }

  void loadProperties() {
    properties.value = [
      {
        'image': 'https://images.unsplash.com/photo-1560184897-ae75f418493e',
        'type': 'Apartment',
        'price': '\$267000',
        'size': '2000sqft',
        'beds': '4',
        'baths': '1',
      },
      {
        'image': 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c',
        'type': 'Apartment',
        'price': '\$300000',
        'size': '1800sqft',
        'beds': '3',
        'baths': '2',
      },
      {
        'image': 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c',
        'type': 'Apartment',
        'price': '\$240000',
        'size': '2200sqft',
        'beds': '5',
        'baths': '2',
      },
    ];
  }

  void select(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1; // tekrar tıklayınca seçim kalkar
    } else {
      selectedIndex.value = index;
    }
  }
}
