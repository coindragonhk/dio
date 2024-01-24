import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/enum.dart';

part 'pay_options.g.dart';

@JsonSerializable()
class PayOptions {
  String? status;
  num? surcharge;

  PayOptions({this.status, this.surcharge});

  factory PayOptions.fromJson(Map<String, dynamic> json) {
    return _$PayOptionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PayOptionsToJson(this);
}
