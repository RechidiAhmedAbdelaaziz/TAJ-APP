import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/request/data/dto/requests_filter.dart';

import '../models/request_model.dart';
import '../source/request_api.dart';
import '../source/request_cache.dart';

@lazySingleton
class RequestRepo extends NetworkRepository {
  final _requestApi = locator<RequestApi>();
  final _requestCache = locator<RequestCache>();

  RepoListResult<RequestModel> getRequests(RequestsFilterDTO filter) {
    return tryApiCall(
      apiCall:
          () => throw UnimplementedError(), //TODO implement API call
      localApiCall: () => _requestCache.getRequest(stateId: filter.stateId),
      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: RequestModel.fromJson,
          ),
    );
  }
}
