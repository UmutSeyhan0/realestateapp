import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PropertyAddView extends GetxController {
  var type = ''.obs;
  var images = <String>[].obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();

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
    if (images.isEmpty ||
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
      "ownerId": userId,
      "images": images,
      "createdAt": Timestamp.now(),

      // Dinamik alanlar
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

    Get.snackbar("Başarılı", "Emlak başarıyla eklendi.");
    clearFields();
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    locationController.clear();
    bedroomsController.clear();
    bathroomsController.clear();
    floorController.clear();
    sizeController.clear();
    buildingAgeController.clear();
    roomsController.clear();
    landSizeController.clear();
    zoningTypeController.clear();
    images.clear();
    type.value = '';
    hasElevator.value = false;
    hasParking.value = false;
  }
}

class AddPropertyView extends StatelessWidget {
  final controller = Get.put(PropertyAddView());

  final List<String> propertyTypes = ["home", "apartment", "office", "land"];

  AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Emlak Ekle")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Zorunlu Alanlar
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(labelText: "Başlık"),
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(labelText: "Açıklama"),
            ),
            TextField(
              controller: controller.priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Fiyat"),
            ),
            TextField(
              controller: controller.locationController,
              decoration: const InputDecoration(labelText: "Lokasyon"),
            ),

            const SizedBox(height: 10),
            Obx(
              () => DropdownButton<String>(
                value: controller.type.value.isEmpty
                    ? null
                    : controller.type.value,
                hint: const Text("Emlak Tipi Seç"),
                items: propertyTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (value) {
                  controller.type.value = value ?? '';
                },
              ),
            ),

            const SizedBox(height: 20),

            // Dinamik Alanlar
            Obx(() {
              switch (controller.type.value) {
                case "home":
                case "apartment":
                  return Column(
                    children: [
                      TextField(
                        controller: controller.bedroomsController,
                        decoration: const InputDecoration(
                          labelText: "Yatak Odası",
                        ),
                      ),
                      TextField(
                        controller: controller.bathroomsController,
                        decoration: const InputDecoration(labelText: "Banyo"),
                      ),
                      TextField(
                        controller: controller.floorController,
                        decoration: const InputDecoration(labelText: "Kat"),
                      ),
                      TextField(
                        controller: controller.sizeController,
                        decoration: const InputDecoration(
                          labelText: "Metrekare",
                        ),
                      ),
                      TextField(
                        controller: controller.buildingAgeController,
                        decoration: const InputDecoration(
                          labelText: "Bina Yaşı",
                        ),
                      ),
                      SwitchListTile(
                        title: const Text("Asansör Var mı?"),
                        value: controller.hasElevator.value,
                        onChanged: (v) => controller.hasElevator.value = v,
                      ),
                      TextField(
                        controller: controller.roomsController,
                        decoration: const InputDecoration(
                          labelText: "Oda Sayısı",
                        ),
                      ),
                      SwitchListTile(
                        title: const Text("Otopark Var mı?"),
                        value: controller.hasParking.value,
                        onChanged: (v) => controller.hasParking.value = v,
                      ),
                    ],
                  );
                case "office":
                  return Column(
                    children: [
                      TextField(
                        controller: controller.floorController,
                        decoration: const InputDecoration(labelText: "Kat"),
                      ),
                      TextField(
                        controller: controller.sizeController,
                        decoration: const InputDecoration(
                          labelText: "Metrekare",
                        ),
                      ),
                      SwitchListTile(
                        title: const Text("Otopark Var mı?"),
                        value: controller.hasParking.value,
                        onChanged: (v) => controller.hasParking.value = v,
                      ),
                    ],
                  );
                case "land":
                  return Column(
                    children: [
                      TextField(
                        controller: controller.landSizeController,
                        decoration: const InputDecoration(
                          labelText: "Arazi Büyüklüğü",
                        ),
                      ),
                      TextField(
                        controller: controller.zoningTypeController,
                        decoration: const InputDecoration(
                          labelText: "İmar Türü",
                        ),
                      ),
                    ],
                  );
                default:
                  return const SizedBox();
              }
            }),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addProperty,
              child: const Text("Ekle"),
            ),
          ],
        ),
      ),
    );
  }
}
