import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/test_view_controller.dart';

class CharacterScreen extends GetView<TestViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rick and Morty Characters")),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: controller.characters.length,
              itemBuilder: (context, index) {
                final character = controller.characters[index];
                return ListTile(
                  onTap: () {
                    // Handle character tap
                    print(character.id);
                  },
                  leading: Image.network(character.image ?? ''),
                  title: Text(character.name ?? 'Unknown'),
                  subtitle: Text(character.status ?? 'Unknown'),
                );
              },
            );
      }),
    );
  }
}
