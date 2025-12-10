import 'package:space_scutum_2/features/episodes/data/data_source/models/episodes_result.dart';

class Episode {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
  });

  factory Episode.fromResponse(EpisodesResult result) {
    return Episode(
      id: result.id ?? 0,
      name: result.name ?? 'Unknown',
      airDate: result.airDate ?? 'Unknown',
      episode: result.episode ?? 'Unknown',
      characters: result.characters ?? [],
    );
  }

  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
}
