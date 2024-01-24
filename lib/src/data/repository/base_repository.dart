import '../network/service/api_result.dart';
import '../network/service/network_exceptions.dart';
import 'package:get_it/get_it.dart';
import '../../utils/logger.dart';

abstract class BaseRepository {
  //'count' to handle for UnauthorizedRequest with multiple api case
  // Avoid show Toast Unautherized many times.
  int count = 0;

  ApiResult<T> handleErrorApi<T>(dynamic e,
      {String tag = "", forceLogout = true}) {
    logger.e("$tag, $e");
    NetworkExceptions exceptions = NetworkExceptions.getDioException(e);
    if (forceLogout && exceptions is UnauthorizedRequest) {
      if (count == 0) {
        count += 1;
      }
      return const ApiResult.failure(error: NetworkExceptions.notFound(""));
    }
    return ApiResult.failure(error: exceptions);
  }
}
