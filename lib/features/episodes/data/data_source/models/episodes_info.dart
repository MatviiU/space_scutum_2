import 'package:json_annotation/json_annotation.dart';

part 'episodes_info.g.dart';

@JsonSerializable()
class EpisodesInfo {
  EpisodesInfo({this.count, this.pages, this.next, this.prev});

  factory EpisodesInfo.fromJson(Map<String, dynamic> json) =>
      _$EpisodesInfoFromJson(json);

  final int? count;
  final int? pages;
  final String? next;
  final dynamic prev;

  Map<String, dynamic> toJson() => _$EpisodesInfoToJson(this);
}
