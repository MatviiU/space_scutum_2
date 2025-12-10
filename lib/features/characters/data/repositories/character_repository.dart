import 'package:dio/dio.dart';
import 'package:space_scutum_2/features/characters/data/data_source/characters_data_source.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';

//Repository layer for getting data from data source

abstract interface class CharacterRepository {
  Future<List<Character>> getCharacters(int page);

  Future<List<Character>> getCharactersByIds(List<String> urls);
}

class CharacterRepositoryImpl implements CharacterRepository {
  //Injecting data source
  CharacterRepositoryImpl(this._dataSource);

  final CharacterDataSource _dataSource;

  @override
  Future<List<Character>> getCharacters(int page) async {
    try {
      final data = await _dataSource.getCharacters(page);
      if (data.results == null) {
        return [];
      }
      return data.results!.map(Character.fromResponse).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Character>> getCharactersByIds(List<String> urls) async {
    try {
      final data = await _dataSource.getCharactersByIds(urls);
      return data.map(Character.fromResponse).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
