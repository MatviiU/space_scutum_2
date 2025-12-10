import 'package:json_annotation/json_annotation.dart';

part 'characters_info.g.dart';

@JsonSerializable()
class CharactersInfo {
  const CharactersInfo({this.count, this.pages, this.next, this.prev});

  factory CharactersInfo.fromJson(Map<String, dynamic> json) =>
      _$CharactersInfoFromJson(json);

  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  Map<String, dynamic> toJson() => _$CharactersInfoToJson(this);
}
