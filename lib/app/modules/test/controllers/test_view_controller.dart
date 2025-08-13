import 'package:get/get.dart';

import '../../../data/models/test_model.dart';
import '../../../data/repository/test_repository.dart';

class TestViewController extends GetxController {
  //Bütün bağımlılıkları burada kullan. Fakat öncesinde binding ile enjekte et.

  final TestRepository _rickAndMortyService = Get.find<TestRepository>();
  List<CharacterModel> characters = [];
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      final data = await _rickAndMortyService.fetchCharacters();
      //print(data);

      characters.assignAll(data);
      isLoading(false);
    } catch (e) {
      print("Error: $e");

      isLoading(false);
    }
  }
}
