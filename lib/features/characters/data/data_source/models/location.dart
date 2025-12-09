import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final String? name;
  final String? url;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
