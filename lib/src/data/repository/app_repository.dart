import 'dart:convert';

import 'package:dtg_web_admin/src/data/models/un_register_device_token_request.dart';
import 'package:dtg_web_admin/src/data/network/service/api_result.dart';
import 'package:dtg_web_admin/src/data/network/service/app_client.dart';

import '../models/register_device_token_request.dart';
import '../network/response/ip_response.dart';
import 'base_repository.dart';

class AppRepository extends BaseRepository {
  Future<IpResponse?> getIp() async {
    try {
      Map<String, dynamic> map = {
        'checksum': '8888',
      };
      IpResponse response = await appClient.getIp(map);
      // response.countryCode = "TH"; // Testing purposes only
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<ApiResult<dynamic>> donate(Map<String, dynamic> map) async {
    try {
      dynamic response = await appClient.donate(map);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> generateYedpayLink(
      Map<String, dynamic> map) async {
    try {
      dynamic response = await appClient.generateYedpayLink(map);

      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> generateYedpayLinkV2(
      String content,
      String idToken,
      num amount,
      String currency,
      String returnUrl,
      String notifyUrl,
      String customId,
      String subject) async {
    try {
      dynamic response = await appClient.generateYedpayLinkV2(content, idToken,
          amount, currency, returnUrl, notifyUrl, customId, subject);

      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> writeTransaction(Map<String, dynamic> body) async {
    try {
      dynamic response = await appClient.writeTxn(body);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> redeem(
      String vendorPath, String suffixPath, Map<String, dynamic> map) async {
    try {
      dynamic response = await appClient.redeem(vendorPath, suffixPath, map);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> redeemWithCountry(String vendorPath,
      String countryPath, String suffixPath, Map<String, dynamic> map) async {
    try {
      dynamic response = await appClient.redeemWithCountry(
          vendorPath, countryPath, suffixPath, map);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> registerDeviceToken(
      String idToken, RegisterDeviceTokenRequest body) async {
    try {
      dynamic response = await appClient.registerDeviceToken(idToken, body);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<dynamic>> unRegisterDeviceToken(
      String idToken, UnRegisterDeviceTokenRequest body) async {
    try {
      dynamic response = await appClient.unRegisterDeviceToken(idToken, body);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }
}
