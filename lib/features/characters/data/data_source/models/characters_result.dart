import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_location.dart';

part 'characters_result.g.dart';

enum Gender {
  @JsonValue('Female')
  female,
  @JsonValue('Male')
  male,
  @JsonValue('unknown')
  unknow,
}

enum Status {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  @JsonValue('unknown')
  unknown,
}

@JsonSerializable()
class CharactersResult {
  CharactersResult({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharactersResult.fromJson(Map<String, dynamic> json) =>
      _$CharactersResultFromJson(json);

  final int? id;
  final String? name;
  final Status? status;
  final String? species;
  final String? type;
  final Gender? gender;
  final CharactersLocation? origin;
  final CharactersLocation? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  Map<String, dynamic> toJson() => _$CharactersResultToJson(this);
}
