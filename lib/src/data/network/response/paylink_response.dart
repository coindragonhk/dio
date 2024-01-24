import 'package:json_annotation/json_annotation.dart';

part 'paylink_response.g.dart';

/*
1	token	String	Token of the online payment
2	expired_at	String	Expiry Time of the online payment link
3	checkout_url	String	Link of the online payment
4	redirect_url	String	(optional) Payment link of the gateway (exists if gateway_code is 4_1 or 9_5)
5	sdk_data	Object	(optional) parameters passed to SDK (exists if gateway_code is 4_3 or 8_3)
6	sdk_data_query_string	String	(optional) A query string which should be passed to Alipay SDK (exists if gateway_code is 4_3)
*/

@JsonSerializable()
class PaylinkResponse {
  bool? success; //true / false
  String? token;
  @JsonKey(name: "checkout_url")
  String? checkoutUrl;
  @JsonKey(name: "redirect_url")
  String? redirectUrl;
  @JsonKey(name: "sdk_data")
  dynamic sdkData;
  @JsonKey(name: "sdk_data_query_string")
  String? sdkDataQueryString;

  PaylinkResponse({
    this.success = true,
    this.token,
    this.checkoutUrl,
    this.redirectUrl,
    this.sdkData,
    this.sdkDataQueryString,
  });

  factory PaylinkResponse.fromJson(Map<String, dynamic> json) {
    return _$PaylinkResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaylinkResponseToJson(this);
}
