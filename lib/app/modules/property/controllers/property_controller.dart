import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyController extends GetxController {
  var type = ''.obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final urlController = TextEditingController();

  // Dinamik alanlar
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final floorController = TextEditingController();
  final sizeController = TextEditingController();
  final buildingAgeController = TextEditingController();
  var hasElevator = false.obs;
  final roomsController = TextEditingController();
  var hasParking = false.obs;
  final landSizeController = TextEditingController();
  final zoningTypeController = TextEditingController();

  Future<void> addProperty() async {
    if (urlController.text.isEmpty ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        type.value.isEmpty ||
        priceController.text.isEmpty ||
        locationController.text.isEmpty) {
      Get.snackbar("Hata", "Lütfen zorunlu alanları doldurun.");
      return;
    }

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      Get.snackbar("Hata", "Kullanıcı giriş yapmamış.");
      return;
    }

    final propertyData = {
      "id": FirebaseFirestore.instance.collection("properties").doc().id,
      "title": titleController.text,
      "description": descriptionController.text,
      "type": type.value,
      "price": double.tryParse(priceController.text) ?? 0,
      "location": locationController.text,
      "url": urlController.text,
      "ownerId": userId,
      "createdAt": Timestamp.now(),
      "bedrooms": bedroomsController.text,
      "bathrooms": bathroomsController.text,
      "floor": floorController.text,
      "size": sizeController.text,
      "buildingAge": buildingAgeController.text,
      "hasElevator": hasElevator.value,
      "rooms": roomsController.text,
      "hasParking": hasParking.value,
      "landSize": landSizeController.text,
      "zoningType": zoningTypeController.text,
    };

    await FirebaseFirestore.instance.collection("properties").add(propertyData);
    Get.back();
    Get.snackbar("Başarılı", "Emlak başarıyla eklendi.");
    clearFields();
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    locationController.clear();
    urlController.clear();
    bedroomsController.clear();
    bathroomsController.clear();
    floorController.clear();
    sizeController.clear();
    buildingAgeController.clear();
    roomsController.clear();
    landSizeController.clear();
    zoningTypeController.clear();
    type.value = '';
    hasElevator.value = false;
    hasParking.value = false;
  }
}
