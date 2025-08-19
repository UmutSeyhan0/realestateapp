import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapp/app/modules/property/controllers/property_controller.dart';

class AddPropertyView extends StatelessWidget {
  AddPropertyView({super.key});
  final propertyTypes = ["home", "apartment", "office", "land"];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PropertyController());

    return Scaffold(
      appBar: AppBar(title: const Text("Emlak Ekle")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
            TextField(
              controller: controller.urlController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(labelText: "URL"),
            ),
            const SizedBox(height: 10),
            Obx(
              () => DropdownButton<String>(
                value: controller.type.value.isEmpty
                    ? null
                    : controller.type.value,
                hint: const Text("Emlak Tipi Seç"),
                items: propertyTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => controller.type.value = v ?? '',
              ),
            ),
            const SizedBox(height: 20),
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
