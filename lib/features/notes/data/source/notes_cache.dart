import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

@lazySingleton
class NotesCache {
  final CacheService _cacheService;
  NotesCache(this._cacheService);

  Future<PaginatedDataResponse> getNotes() async {
    //TODO change to get by key
    final json = await _cacheService.getJson(
      "assets/json/notes.json",
    );

    return PaginatedDataResponse.fromJson(json);
  }
}
