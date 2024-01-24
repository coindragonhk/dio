import 'package:json_annotation/json_annotation.dart';
part 'un_register_device_token_request.g.dart';

@JsonSerializable()
class UnRegisterDeviceTokenRequest {
  String? deviceId;

  UnRegisterDeviceTokenRequest({this.deviceId});

  factory UnRegisterDeviceTokenRequest.fromJson(Map<String, dynamic> json) {
    return _$UnRegisterDeviceTokenRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UnRegisterDeviceTokenRequestToJson(this);
}
