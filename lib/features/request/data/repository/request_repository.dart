import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';

import '../models/request_model.dart';
import '../source/request_api.dart';
import '../source/request_cache.dart';

@lazySingleton
class RequestRepo extends NetworkRepository {
  final _requestApi = locator<RequestApi>();
  final _requestCache = locator<RequestCache>();

  RepoListResult<RequestModel> getRequests() {
    return tryApiCall(
      apiCall:
          () => throw UnimplementedError(), //TODO implement API call
      localApiCall: () => _requestCache.getRequest(),
      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: RequestModel.fromJson,
          ),
    );
  }
}
