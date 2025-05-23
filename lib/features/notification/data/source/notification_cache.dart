import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

@lazySingleton
class NotificationCache {
  final CacheService _cacheService;

  NotificationCache(this._cacheService);

  Future<MultiDataApiResponse> getNotification() async {
    final json = await _cacheService.getJson(
      "assets/json/notification.json",
    );

    return MultiDataApiResponse.fromJson(json);
  }
}
