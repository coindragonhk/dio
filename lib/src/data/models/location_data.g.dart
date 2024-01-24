// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      locationId: json['locationId'] as String?,
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
      company: json['company'] as String?,
      category: json['category'] as String?,
      hours: json['hours'] as String?,
      addressCh: json['addressCH'] as String?,
      addressEn: json['addressEN'] as String?,
      listingCh: json['listingCH'] as String?,
      listingEn: json['listingEN'] as String?,
      regionCh: json['regionCH'] as String?,
      regionEn: json['regionEN'] as String?,
      status: json['status'] as String?,
      unAvailableDonationVoucher: json['unAvailableDonationVoucher'] as bool?,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'lat': instance.lat,
      'lng': instance.lng,
      'company': instance.company,
      'hours': instance.hours,
      'addressCH': instance.addressCh,
      'addressEN': instance.addressEn,
      'listingCH': instance.listingCh,
      'listingEN': instance.listingEn,
      'regionCH': instance.regionCh,
      'regionEN': instance.regionEn,
      'category': instance.category,
      'status': instance.status,
      'unAvailableDonationVoucher': instance.unAvailableDonationVoucher,
    };
