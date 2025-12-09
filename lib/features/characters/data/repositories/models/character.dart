import 'package:space_scutum_2/features/characters/data/data_source/models/result.dart';

class Character {
  const Character({
    required this.name,
    required this.status,
    required this.image,
  });

  factory Character.fromResponse(Result result) {
    return Character(
      name: result.name ?? 'Unknown',
      status: result.status?.name ?? 'Unknown',
      image: result.image ?? '',
    );
  }

  final String name;
  final String status;
  final String image;
  //final String species;
  //final String type;
  //final String gender;
  //final String location;
  //final List<String> episode;
}
