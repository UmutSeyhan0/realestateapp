import '../../../core/enums/methods_enum.dart';
import '../../../core/service/general_service.dart';
import '../models/test_model.dart';

class TestProvider {
  final NetworkService _networkService = NetworkService.instance;

  Future<List<CharacterModel>> fetchCharacters() async {
    const String path = "/character";

    // API'den yanıt al
    final response = await _networkService.http<CharacterModel>(
      path,
      CharacterModel(),
      Methods.get,
      baseUrl: "https://rickandmortyapi.com/api",
    );

    if (response is List) {
      final characters = response.whereType<CharacterModel>().toList();
      return characters;
    } else if (response is Map<String, dynamic> &&
        response['results'] is List) {
      final results = response['results'] as List;
      return results.map((e) => CharacterModel().fromJson(e)).toList();
    }

    return [];
  }
}
