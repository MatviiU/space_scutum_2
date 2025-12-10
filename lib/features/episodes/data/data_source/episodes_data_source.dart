import 'package:space_scutum_2/core/network/test_api.dart';
import 'package:space_scutum_2/features/episodes/data/data_source/models/episodes_result.dart';

abstract interface class EpisodesDataSource {
  Future<List<EpisodesResult>> getEpisodesByIds(List<String> ids);
}

class EpisodesDataSourceImpl implements EpisodesDataSource {
  EpisodesDataSourceImpl(this._api);

  final TestApi _api;

  //Getting episodes by ids
  @override
  Future<List<EpisodesResult>> getEpisodesByIds(List<String> urls) async {
    if (urls.isEmpty) return [];

    final episodes = await _api.getEpisodesByIds(
      urls.map((url) => url.split('/').last).join(','),
    );

    return EpisodesResult.listFromJson(episodes);
  }
}
