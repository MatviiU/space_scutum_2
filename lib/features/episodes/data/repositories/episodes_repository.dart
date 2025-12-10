import 'package:space_scutum_2/features/episodes/data/data_source/episodes_data_source.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/models/episode.dart';

abstract interface class EpisodesRepository {
  Future<List<Episode>> getEpisodes(int page);

  Future<List<Episode>> getEpisodesByIds(List<String> urls);
}

class EpisodesRepositoryImpl implements EpisodesRepository {
  EpisodesRepositoryImpl(this._dataSource);

  final EpisodesDataSource _dataSource;

  @override
  Future<List<Episode>> getEpisodes(int page) async {
    final data = await _dataSource.getEpisodes(page);
    if (data.results == null) {
      return [];
    }
    return data.results!.map(Episode.fromResponse).toList();
  }

  @override
  Future<List<Episode>> getEpisodesByIds(List<String> urls) async {
    final data = await _dataSource.getEpisodesByIds(urls);
    return data.map(Episode.fromResponse).toList();
  }
}
