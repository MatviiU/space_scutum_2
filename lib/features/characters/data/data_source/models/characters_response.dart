import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_info.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/characters_result.dart';
part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  CharactersResponse({this.info, this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  final CharactersInfo? info;
  final List<CharactersResult>? results;

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
