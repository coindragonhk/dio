import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../utils/const.dart';
import '../../../utils/dio_logger.dart';
import '../../../utils/logger.dart';
import '../app_api.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class AppClient {
  late AppApi appClient;
  late Link link;
  late Dio dio;

  AppClient._privateConstructor() {
    _setupClient();
  }

  static final AppClient _instance = AppClient._privateConstructor();

  factory AppClient() {
    return _instance;
  }

  void _setupClient() async {
    dio = Dio(BaseOptions(
        baseUrl: Const.FIRE_STORE_BASE_URL,
        receiveTimeout: const Duration( milliseconds: 60 * 1000 * 1 ),
        connectTimeout: const Duration( milliseconds: 60 * 1000 * 1 ),
        contentType: "application/json"));
    dio
      ..options.connectTimeout = const Duration( milliseconds: _defaultConnectTimeout)
      ..options.receiveTimeout = const Duration( milliseconds: _defaultReceiveTimeout)
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if (kDebugMode) {
    //   dio.interceptors.add(PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseBody: true,
    //       responseHeader: true,
    //       error: true,
    //       compact: true,
    //       maxWidth: 1000,
    //     logPrint: (object) {
    //         if (isLogConsole) {
    //           print(object);
    //         } else {
    //           File file = File(Const.LOG_FILE_NAME);
    //           IOSink sink = file.openWrite(
    //             mode: FileMode.writeOnlyAppend,
    //             encoding: utf8
    //           );
    //           sink.writeAll([object], '\n');
    //           sink.writeln();
    //         }
    //     }
    //   ));
      dio.interceptors.add(dioLoggerInterceptor);
    }


    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options);
    }, onResponse: (response, handler) async {
      if (response.data?.toString().contains("code") == true &&
          response.data?["code"] == 401) {
        response.statusCode = 401;
        return handler.reject(DioException(
            requestOptions: response.requestOptions,
            error: "${response.data["errorCode"]}",
            type: DioExceptionType.badResponse,
            response: response));
      }
      if (response.data is Map && response.data?["error"] != null) {
        return handler.reject(DioException(
            requestOptions: response.requestOptions,
            error: "${response.data["error"]}",
            type: DioExceptionType.badResponse,
            response: response));
      }
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response?.data is Map &&
          error.response?.data?["error"] != null) {
        return handler.next(DioException(
            requestOptions: error.requestOptions,
            error: "${error.response?.data["error"]}",
            type: DioExceptionType.badResponse,
            response: error.response));
      }
      if (error.error is SocketException) {
        logger.e("${error.error}");
      }
      return handler.next(error); //continue
    }));
    appClient = AppApi(dio);
  }
}

AppClient client = AppClient();
AppApi appClient = client.appClient;
Link link = client.link;
Dio dio = client.dio;
