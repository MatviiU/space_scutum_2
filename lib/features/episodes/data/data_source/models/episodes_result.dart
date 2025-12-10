import 'package:json_annotation/json_annotation.dart';

part 'episodes_result.g.dart';

@JsonSerializable()
class EpisodesResult {
  EpisodesResult({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory EpisodesResult.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResultFromJson(json);

  //This method created because API response is not correct
  // for different requests
  static List<EpisodesResult> listFromJson(dynamic data) {
    if (data is List) {
      return data
          .map((e) => EpisodesResult.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (data is Map<String, dynamic>) {
      return [EpisodesResult.fromJson(data)];
    }
    return [];
  }

  final int? id;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final DateTime? created;

  Map<String, dynamic> toJson() => _$EpisodesResultToJson(this);
}
