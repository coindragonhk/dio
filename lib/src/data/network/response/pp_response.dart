import 'package:json_annotation/json_annotation.dart';

part 'pp_response.g.dart';

@JsonSerializable()
class PPResponse {
  String? name;
  num? order;
  String? entryZH;
  String? entryEN;
  String? entryTH;
  String? headerZH;
  String? headerEN;
  String? headerTH;

  PPResponse(
      {this.name,
      this.entryEN,
      this.entryZH,
      this.entryTH,
      this.headerZH,
      this.headerEN,
      this.headerTH});

  factory PPResponse.fromJson(Map<String, dynamic> json) =>
      _$PPResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PPResponseToJson(this);
}
