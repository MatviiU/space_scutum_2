import 'package:space_scutum_2/features/characters/data/data_source/models/characters_result.dart';

class Character {
  const Character({
    required this.episodes,
    required this.id,
    required this.location,
    required this.species,
    required this.name,
    required this.status,
    required this.image,
  });

  factory Character.fromResponse(CharactersResult result) {
    return Character(
      id: result.id ?? 0,
      name: result.name ?? 'Unknown',
      status: result.status?.name ?? 'Unknown',
      image: result.image ?? '',
      species: result.species ?? 'Unknown',
      location: result.location?.name ?? 'Unknown',
      episodes: result.episode ?? [],
    );
  }

  final int id;
  final String name;
  final String status;
  final String image;
  final String species;
  final String location;
  final List<String> episodes;
}
