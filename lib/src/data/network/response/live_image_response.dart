import 'package:json_annotation/json_annotation.dart';

part 'live_image_response.g.dart';

@JsonSerializable()
class LiveImageResponse {
  String? assetPathCH;
  String? assetPathEN;
  String? assetPathTH;
  String? assetPath;
  String? name;

  LiveImageResponse(
      {required this.assetPath,
      this.assetPathEN,
      this.assetPathCH,
      this.assetPathTH,
      required this.name});

  factory LiveImageResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LiveImageResponseToJson(this);
}
