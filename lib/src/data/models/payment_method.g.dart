// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      paymentMethod: $enumDecodeNullable(
          _$PaymentMethodOptionsEnumMap, json['paymentMethod']),
      image: json['image'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'paymentMethod': _$PaymentMethodOptionsEnumMap[instance.paymentMethod],
      'image': instance.image,
      'value': instance.value,
    };

const _$PaymentMethodOptionsEnumMap = {
  PaymentMethodOptions.COIN_DEPOSIT: 'COIN_DEPOSIT',
  PaymentMethodOptions.NOTE_DEPOSIT: 'NOTE_DEPOSIT',
  PaymentMethodOptions.DRAGON_REWARD: 'DRAGON_REWARD',
  PaymentMethodOptions.OCTOPUS: 'OCTOPUS',
  PaymentMethodOptions.ALIPAY: 'ALIPAY',
  PaymentMethodOptions.VISA: 'VISA',
  PaymentMethodOptions.PAYME: 'PAYME',
  PaymentMethodOptions.WECHAT_PAY: 'WECHAT_PAY',
};
