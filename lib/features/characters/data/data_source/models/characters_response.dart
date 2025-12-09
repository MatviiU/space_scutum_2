import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/info.dart';
import 'package:space_scutum_2/features/characters/data/data_source/models/result.dart';
part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  CharactersResponse({this.info, this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  final Info? info;
  final List<Result>? results;

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
