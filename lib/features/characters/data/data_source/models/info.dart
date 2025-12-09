import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  const Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
