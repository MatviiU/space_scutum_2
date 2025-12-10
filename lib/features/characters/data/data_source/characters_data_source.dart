import 'package:space_scutum_2/core/network/test_api.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_response.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_result.dart';

//Data source layer for getting data from API

abstract interface class CharacterDataSource {
  Future<CharactersResponse> getCharacters(int page);

  Future<List<CharactersResult>> getCharactersByIds(List<String> urls);
}

class CharacterDataSourceImpl implements CharacterDataSource {
  //Injecting API

  CharacterDataSourceImpl(this._api);

  final TestApi _api;

  @override
  Future<CharactersResponse> getCharacters(int page) {
    return _api.getCharacters(page);
  }

  @override
  Future<List<CharactersResult>> getCharactersByIds(List<String> urls) async {
    if (urls.isEmpty) return [];

    final characters = await _api.getCharactersByIds(
      urls.map((url) => url.split('/').last).join(','),
    );

    return CharactersResult.listFromJson(characters);
  }
}
