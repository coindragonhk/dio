import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dtg_web_admin/src/data/network/response/ip_response.dart';
import 'package:dtg_web_admin/src/utils/secure.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

import '../../utils/const.dart';
import '../models/register_device_token_request.dart';
import '../models/un_register_device_token_request.dart';
part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST("https://cds3.dyndns.ws:3000/drrewards/unlink")
  @retrofit.Headers(<String, dynamic>{
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Access-Control_Allow_Origin": "*"
  })
  Future<dynamic> unlinkAccount(@Body() Map<String, dynamic> map);

  @POST("https://coindragon-tx-server.dynalias.net:3000/utils/getIPRegion")
  Future<IpResponse> getIp(@Body() Map<String, dynamic> map);

  @POST(
      "https://coindragon-tx-server.dynalias.net:3000/drrewards/unlock_reward")
  Future<dynamic> unlockReward(@Body() Map<String, dynamic> map);

  @POST("https://coindragon-tx-server.dynalias.net:3000/drrewards/donate")
  Future<dynamic> donate(@Body() Map<String, dynamic> map);

  @POST(
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/{vendorPath}/{suffixPath}')
  Future<dynamic> redeem(@Path("vendorPath") String vendorPath,
      @Path("suffixPath") String suffixPath, @Body() Map<String, dynamic> map);

  @POST(
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/{vendorPath}/{countryPath}/{suffixPath}')
  Future<dynamic> redeemWithCountry(
      @Path("vendorPath") String vendorPath,
      @Path("countryPath") String countryPath,
      @Path("suffixPath") String suffixPath,
      @Body() Map<String, dynamic> map);

  @POST("${Const.API_BASE_URL}writeTransaction")
  Future<dynamic> writeTxn(@Body() Map<String, dynamic> map);

  @POST("https://app.dragonrewards.io/genLink")
  Future<dynamic> generateYedpayLink(@Body() Map<String, dynamic> map);

  @POST("https://api-staging.yedpay.com/v1/online-payment")
  @FormUrlEncoded()
  Future<dynamic> generateYedpayLinkV2(
      @Header("Content-Type") String content,
      @Header("Authorization") String apiKey,
      @Field("amount") num amount,
      @Field("currency") String currency,
      @Field("return_url") String returnUrl,
      @Field("notify_url") String notifyUrl,
      @Field("custom_id") String customId,
      @Field("subject") String subject);

  @POST("${Const.NOTIFICATION_BASE_API}register-device-token")
  Future<dynamic> registerDeviceToken(
    @Header("Authorization") String idToken,
    @Body() RegisterDeviceTokenRequest body,
  );

  @POST("${Const.NOTIFICATION_BASE_API}unregister-device-token")
  Future<dynamic> unRegisterDeviceToken(
    @Header("Authorization") String idToken,
    @Body() UnRegisterDeviceTokenRequest body,
  );
}
