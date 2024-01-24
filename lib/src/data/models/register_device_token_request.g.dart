// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceTokenRequest _$RegisterDeviceTokenRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceTokenRequest(
      deviceToken: json['deviceToken'] as String?,
      deviceId: json['deviceId'] as String?,
    )..platform = json['platform'] as String?;

Map<String, dynamic> _$RegisterDeviceTokenRequestToJson(
        RegisterDeviceTokenRequest instance) =>
    <String, dynamic>{
      'deviceToken': instance.deviceToken,
      'deviceId': instance.deviceId,
      'platform': instance.platform,
    };
