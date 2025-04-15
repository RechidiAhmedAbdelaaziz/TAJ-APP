import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';

import '../source/real_states_api.dart';
import '../source/real_states_cache.dart';

@lazySingleton
class RealStatesRepo extends NetworkRepository {
  final _real_statesApi = locator<RealStatesApi>();
  final _statesCache = locator<RealStatesCache>();

  RepoListResult<RealStateModel> getRealStates() {
    return tryApiCall(
      apiCall:
          () => throw UnimplementedError(), //TODO implement API call
      localApiCall: () async => await _statesCache.getRealStates(),
      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: RealStateModel.fromJson,
          ),
    );
  }

  RepoListResult<RealStateModel> getRealStatesWarranty() {
    return tryApiCall(
      apiCall:
          () => throw UnimplementedError(), //TODO implement API call
      localApiCall:
          () async => await _statesCache.getRealStatesWarranty(),
      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: RealStateModel.fromJson,
          ),
    );
  }
}
