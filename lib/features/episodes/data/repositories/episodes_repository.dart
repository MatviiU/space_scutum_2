import 'package:dio/dio.dart';
import 'package:space_scutum_2/features/episodes/data/data_source/episodes_data_source.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/models/episode.dart';

abstract interface class EpisodesRepository {
  Future<List<Episode>> getEpisodesByIds(List<String> urls);
}

class EpisodesRepositoryImpl implements EpisodesRepository {
  EpisodesRepositoryImpl(this._dataSource);

  final EpisodesDataSource _dataSource;

  @override
  Future<List<Episode>> getEpisodesByIds(List<String> urls) async {
    try {
      final data = await _dataSource.getEpisodesByIds(urls);
      return data.map(Episode.fromResponse).toList();
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
