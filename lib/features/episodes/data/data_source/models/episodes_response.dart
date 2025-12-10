import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_2/features/episodes/data/data_source/models/episodes_info.dart';
import 'package:space_scutum_2/features/episodes/data/data_source/models/episodes_result.dart';

part 'episodes_response.g.dart';

@JsonSerializable()
class EpisodesResponse {
  EpisodesResponse({this.info, this.results});

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseFromJson(json);

  final EpisodesInfo? info;
  final List<EpisodesResult>? results;

  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);
}
