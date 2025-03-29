import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';
import 'package:taj_elsafa/core/services/files/files_service.dart';

class HomeLocalStorage {
  final String _storageKey = 'home_banners';

  final _cacheService = locator<CacheService>();
  final _filesService = locator<FilesService>();

  Future<PaginatedDataResponse> fetchBanners() async {
    // final dataJson = await locator<CacheService>().getJson(
    //   _storageKey,
    // ); //TODO: uncomment this line to fetch from cache

    final dataJson = await _filesService.readJson(
      'assets/json/home_banners.json', //TODO : Create a local json file
    );

    return PaginatedDataResponse.fromJson(dataJson);
  }
}
