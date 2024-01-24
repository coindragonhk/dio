import 'package:json_annotation/json_annotation.dart';

part 'faq_response.g.dart';

@JsonSerializable()
class FaqResponse {
  String? ansCH;
  String? ansEN;
  String? ansSCH;
  String? ansTH;
  String? qCH;
  String? qEN;
  String? qSCH;
  String? qTH;

  FaqResponse(
      {this.ansCH,
      this.ansEN,
      this.ansSCH,
      this.ansTH,
      this.qCH,
      this.qEN,
      this.qSCH,
      this.qTH});

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FaqResponseToJson(this);
}
