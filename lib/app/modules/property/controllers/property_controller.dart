import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PropertyController extends GetxController {
  var type = ''.obs;

  // Zorunlu alanlar
  var title = ''.obs;
  var description = ''.obs;
  var price = 0.0.obs;
  var location = ''.obs;
  var images = <String>[].obs;

  // Dinamik alanlar
  var bedrooms = 0.obs;
  var bathrooms = 0.obs;
  var floor = 0.obs;
  var size = 0.0.obs;
  var buildingAge = 0.obs;
  var hasElevator = false.obs;
  var rooms = 0.obs;
  var hasParking = false.obs;
  var landSize = 0.0.obs;
  var zoningType = ''.obs;

  // Emlak ekleme
  Future<void> addProperty() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw 'Giriş yapılmamış!';

      final id = const Uuid().v4(); // benzersiz id
      final data = {
        'id': id,
        'title': title.value,
        'description': description.value,
        'type': type.value,
        'price': price.value,
        'location': location.value,
        'ownerId': uid,
        'images': images,
        'createdAt': Timestamp.now(),

        // Dinamik alanlar (boş değilse ekle)
        if (bedrooms.value > 0) 'bedrooms': bedrooms.value,
        if (bathrooms.value > 0) 'bathrooms': bathrooms.value,
        if (floor.value > 0) 'floor': floor.value,
        if (size.value > 0) 'size': size.value,
        if (buildingAge.value > 0) 'buildingAge': buildingAge.value,
        'hasElevator': hasElevator.value,
        if (rooms.value > 0) 'rooms': rooms.value,
        'hasParking': hasParking.value,
        if (landSize.value > 0) 'landSize': landSize.value,
        if (zoningType.value.isNotEmpty) 'zoningType': zoningType.value,
      };

      await FirebaseFirestore.instance
          .collection('properties')
          .doc(id)
          .set(data);

      Get.snackbar('Başarılı', 'Emlak eklendi');
    } catch (e) {
      Get.snackbar('Hata', e.toString());
    }
  }
}
