import 'package:space_scutum_2/features/characters/data/data_source/characters_data_source.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';

//Repository layer for getting data from data source

abstract interface class CharacterRepository {
  Future<List<Character>> getCharacters(int page);
}

class CharacterRepositoryImpl implements CharacterRepository {
  //Injecting data source
  CharacterRepositoryImpl(this._dataSource);

  final CharacterDataSource _dataSource;

  @override
  Future<List<Character>> getCharacters(int page) async {
    final data = await _dataSource.getCharacters(page);
    if (data.results == null) {
      return [];
    }
    return data.results!.map(Character.fromResponse).toList();
  }
}
