import 'package:json_annotation/json_annotation.dart';

import '../../utils/const.dart';
import '../../utils/date_util.dart';

part 'location_data.g.dart';

@JsonSerializable()
class LocationData {
  String? locationId;
  num? lat;
  num? lng;
  String? company;
  String? hours;
  @JsonKey(name: 'addressCH')
  String? addressCh;
  @JsonKey(name: 'addressEN')
  String? addressEn;
  @JsonKey(name: 'listingCH')
  String? listingCh;
  @JsonKey(name: 'listingEN')
  String? listingEn;
  @JsonKey(name: 'regionCH')
  String? regionCh;
  @JsonKey(name: 'regionEN')
  String? regionEn;
  String? category;
  String? status;
  bool? unAvailableDonationVoucher;

  LocationData(
      {this.locationId,
      this.lat,
      this.lng,
      this.company,
      this.category,
      this.hours,
      this.addressCh,
      this.addressEn,
      this.listingCh,
      this.listingEn,
      this.regionCh,
      this.regionEn,
      this.status,
      this.unAvailableDonationVoucher});

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return _$LocationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationData &&
          locationId == other.locationId &&
          lat == other.lat &&
          lng == other.lng &&
          category == other.category &&
          company == other.company &&
          hours == other.hours &&
          addressEn == other.addressEn &&
          addressCh == other.addressCh &&
          listingEn == other.listingEn &&
          listingCh == other.listingCh &&
          regionEn == other.regionEn &&
          regionCh == other.regionCh &&
          //status == other.status &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode ^ locationId.hashCode;

  bool isKioskAvailable() {
    List<String> times = (hours ?? "").split("-");
    print("hour: $hours ,length: ${times.length}");
    if (times.length != 2) return true;
    try {
      DateTime now = DateTime.now();
      DateTime? startTime = DateUtil.parseStringToDate(
        times[0]
            .toLowerCase()
            .replaceAll("am", "AM")
            .replaceAll("pm", "PM")
            .replaceAll(" ", "")
            .trim(),
        format: Const.DATE_KIOSK_AVAILABLE_FORMAT,
      );
      DateTime? endTime = DateUtil.parseStringToDate(
        times[1]
            .toLowerCase()
            .replaceAll("am", "AM")
            .replaceAll("pm", "PM")
            .replaceAll(" ", "")
            .trim(),
        format: Const.DATE_KIOSK_AVAILABLE_FORMAT,
      );
      if (startTime == null || endTime == null) return false;
      startTime = DateTime(now.year, now.month, now.day, startTime.hour,
          startTime.minute, 0, 0, 0);
      endTime = DateTime(
          now.year, now.month, now.day, endTime.hour, endTime.minute, 0, 0, 0);
      return (startTime.isAtSameMomentAs(now) ||
              endTime.isAtSameMomentAs(now)) ||
          (now.isAfter(startTime) && now.isBefore(endTime));
    } catch (e) {
      return true;
    }
  }
}
