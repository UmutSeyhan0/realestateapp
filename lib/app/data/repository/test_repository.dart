import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/test_model.dart';
import '../providers/test_provider.dart';

class TestRepository {
  final TestProvider _testProvider = Get.find<TestProvider>();

  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      //local storagede ara yoksa veritabanında ara
      final data = await _testProvider.fetchCharacters();
      return data;
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  Future<CharacterModel?> fetchCharacterById(int id) async {
    try {
      //  final data = await _testProvider.fetchCharacterById(id);
      // return data;
      return null;
    } catch (e) {
      print("Error: $e");
      return CharacterModel();
    }
  }
}
