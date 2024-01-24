import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'register_device_token_request.g.dart';

@JsonSerializable()
class RegisterDeviceTokenRequest {
  String? deviceToken;
  String? deviceId;
  String? platform = Platform.isAndroid ? "ANDROID" : "IOS";

  RegisterDeviceTokenRequest({this.deviceToken, this.deviceId});

  factory RegisterDeviceTokenRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterDeviceTokenRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterDeviceTokenRequestToJson(this);
}
