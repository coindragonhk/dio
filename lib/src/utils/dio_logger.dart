import 'package:dio/dio.dart';

import 'logger.dart';

final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });

  logger.d(
      "\n┌------------------------------------------------------------------------------"
      "| [DIO] Request: ${options.method} ${options.uri}"
      "| ${options.data.toString()}"
      "| Headers:\n$headers"
      "├------------------------------------------------------------------------------");
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  logger.d(
      "\n| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}"
      "└------------------------------------------------------------------------------");
  handler.next(response);
  // return response; // continue
}, onError: (DioError error, handler) async {
  logger.d("\n| [DIO] Error: ${error.error}: ${error.response?.toString()}"
      "└------------------------------------------------------------------------------");
  handler.next(error); //continue
});
