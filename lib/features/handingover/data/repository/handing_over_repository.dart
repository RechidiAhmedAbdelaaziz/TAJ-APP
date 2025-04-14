import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/handingover/data/models/handing_over_module.dart';

import '../source/handing_over_api.dart';
import '../source/handing_over_cache.dart';

@lazySingleton
class HandingOverRepo extends NetworkRepository {
  final _handing_overApi = locator<HandingOverApi>();
  final _handingOverCache = locator<HandingOverCache>();

  RepoResult<HandingOverModel> getProjectCondition() {
    return tryApiCall(
      apiCall:
          () => throw UnimplementedError(), //TODO implement API call
      localApiCall: () => _handingOverCache.getConditions(),
      onResult:
          (response) => HandingOverModel.fromJson(response.data!),
    );
  }
}
