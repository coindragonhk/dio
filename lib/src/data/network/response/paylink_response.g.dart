// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paylink_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaylinkResponse _$PaylinkResponseFromJson(Map<String, dynamic> json) =>
    PaylinkResponse(
      success: json['success'] as bool? ?? true,
      token: json['token'] as String?,
      checkoutUrl: json['checkout_url'] as String?,
      redirectUrl: json['redirect_url'] as String?,
      sdkData: json['sdk_data'],
      sdkDataQueryString: json['sdk_data_query_string'] as String?,
    );

Map<String, dynamic> _$PaylinkResponseToJson(PaylinkResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'checkout_url': instance.checkoutUrl,
      'redirect_url': instance.redirectUrl,
      'sdk_data': instance.sdkData,
      'sdk_data_query_string': instance.sdkDataQueryString,
    };
