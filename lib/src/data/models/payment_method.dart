import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/enum.dart';

part 'payment_method.g.dart';

@JsonSerializable()
class PaymentMethod extends Equatable{

  PaymentMethodOptions? paymentMethod;
  String? image;
  String? value;

  PaymentMethod({this.paymentMethod, this.image, this.value});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return _$PaymentMethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
  
  @override
  List<Object?> get props => [image];

  
}
