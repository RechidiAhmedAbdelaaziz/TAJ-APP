import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/notification/data/models/notification_model.dart';

import '../source/notification_api.dart';
import '../source/notification_cache.dart';

@lazySingleton
class NotificationRepo extends NetworkRepository {
  final _notificationApi = locator<NotificationApi>();
  final _notificationCache = locator<NotificationCache>();

  RepoListResult<NotificationModel> getNotifications() {
    return tryApiCall(
      apiCall:
          () => throw UnimplementedError(), //TODO implement API call
      localApiCall:
          () async => await _notificationCache.getNotification(),
      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: NotificationModel.fromJson,
          ),
    );
  }
}
