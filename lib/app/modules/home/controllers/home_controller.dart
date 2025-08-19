import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var properties = <Map<String, dynamic>>[].obs; // dynamic olarak değiştirdim

  final RxInt currentIndex = 0.obs;

  void changeTab(int i) => currentIndex.value = i;

  // Yeni eklenen özellikler
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  // Emlak tipleri mapping
  final List<String> propertyTypes = ['home', 'apartment', 'office', 'land'];

  @override
  void onInit() {
    super.onInit();
    // Başlangıçta home tipindeki emlakları yükle
    loadPropertiesByIndex(0);
  }

  void select(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1; // tekrar tıklayınca seçim kalkar
      properties.clear(); // seçim kalkarsa emlakları temizle
    } else {
      selectedIndex.value = index;
      loadPropertiesByIndex(index); // yeni seçimde emlakları yükle
    }
  }

  // Yeni eklenen fonksiyonlar

  // Index'e göre emlakları yükle
  Future<void> loadPropertiesByIndex(int index) async {
    if (index >= 0 && index < propertyTypes.length) {
      await loadPropertiesByType(propertyTypes[index]);
    }
  }

  // Belirli tipteki emlakları yükle
  Future<void> loadPropertiesByType(String type) async {
    try {
      isLoading.value = true;

      QuerySnapshot querySnapshot = await _firestore
          .collection('properties') // Firestore koleksiyon adınızı buraya yazın
          .where('type', isEqualTo: type)
          .get();

      properties.value = querySnapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      Get.snackbar('Hata', 'Emlaklar yüklenirken bir hata oluştu: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fiyatı formatla
  String formatPrice(dynamic price) {
    if (price == null) return '0 ₺';

    int priceInt = price is int ? price : int.tryParse(price.toString()) ?? 0;

    if (priceInt >= 1000000) {
      double million = priceInt / 1000000.0;
      return '${million.toStringAsFixed(1)}M ₺';
    } else if (priceInt >= 1000) {
      double thousand = priceInt / 1000.0;
      return '${thousand.toStringAsFixed(0)}K ₺';
    }

    return '$priceInt ₺';
  }

  // Emlak tipini Türkçeye çevir
  String getPropertyTypeName(int index) {
    if (index < 0 || index >= propertyTypes.length) return '';

    switch (propertyTypes[index]) {
      case 'home':
        return 'Ev';
      case 'apartment':
        return 'Daire';
      case 'office':
        return 'Ofis';
      case 'land':
        return 'Arazi';
      default:
        return propertyTypes[index];
    }
  }
}
