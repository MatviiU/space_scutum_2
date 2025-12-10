import 'package:json_annotation/json_annotation.dart';

part 'characters_location.g.dart';

@JsonSerializable()
class CharactersLocation {
  CharactersLocation({this.name, this.url});

  factory CharactersLocation.fromJson(Map<String, dynamic> json) =>
      _$CharactersLocationFromJson(json);

  final String? name;
  final String? url;

  Map<String, dynamic> toJson() => _$CharactersLocationToJson(this);
}
