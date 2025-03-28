import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:flutter/material.dart';
import 'package:taj_elsafa/core/services/connectivity/connectivity_helper.dart';

import 'api_error.handler.dart';
import 'models/api_error.model.dart';
import 'types/api_result.type.dart';

typedef RepoResult<T> = Future<ApiResult<T>>;
typedef RepoListResult<T> = Future<ApiResult<PaginationResult<T>>>;

class NetworkRepository {
  Future<ApiResult<T>> tryApiCall<T>({
    required Future<Map<String, dynamic>> Function() apiCall,
    Future<Map<String, dynamic>> Function()? localApiCall,
    required T Function(Map<String, dynamic> json) onResult,
  }) async {
    final hasInternet =
        await locator<ConnectivityHelper>().hasInternet();

    if (hasInternet) {
      try {
        return ApiResult.success(onResult(await apiCall()));
      } catch (e) {
        debugPrint("Error occurred while calling API: $e");
        return ApiResult.error(ApiErrorHandler.handle(e));
      }
    } else if (localApiCall != null) {
      try {
        return ApiResult.success(onResult(await localApiCall()));
      } catch (e) {
        debugPrint("Error occurred while calling local API: $e");
        return ApiResult.error(ApiErrorHandler.handle(e));
      }
    }

    return ApiResult.error(
      const ApiErrorModel(message: "No internet connection"),
    );
  }
}
