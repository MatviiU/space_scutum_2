import 'package:space_scutum_2/core/network/test_api.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_response.dart';

//Data source layer for getting data from API

abstract interface class CharacterDataSource {
  Future<CharactersResponse> getCharacters(int page);
}

class CharacterDataSourceImpl implements CharacterDataSource {
  //Injecting API

  CharacterDataSourceImpl(this._api);

  final TestApi _api;

  @override
  Future<CharactersResponse> getCharacters(int page) {
    return _api.getCharacters(page);
  }
}
