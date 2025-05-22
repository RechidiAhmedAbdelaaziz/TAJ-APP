import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';
import 'package:taj_elsafa/core/services/cloudstorage/cloud_storage.service.dart';
import 'package:taj_elsafa/core/services/cloudstorage/cloudinary.service.dart';
import 'package:taj_elsafa/core/services/dio/dio.service.dart';
import 'package:taj_elsafa/core/services/filepicker/filepick.service.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();

Future<void> setupLocator() async {
  configureDependencies();

  // Local Authentication
  locator.registerLazySingleton(() => LocalAuthentication());

  // SharedPreferences and FlutterSecureStorage
  final sharedpref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedpref);
  locator.registerLazySingleton(() => FlutterSecureStorage());

  //CacheService
  locator.registerLazySingleton(() => CacheService());
  locator.registerLazySingleton<AuthCache>(() => SecureAuthCache());

  //Dio
  locator.registerLazySingleton(() => DioService.getDio());

  //Router
  locator.registerSingleton(AppRouter());

  //File Picker
  locator.registerLazySingleton<MediaPickerService>(
    () => kIsWeb ? WebFilePicker() : MobileFilePicker(),
  );

  //Cloud storage service
  locator.registerLazySingleton<ImageCloudStorageService>(
    () => ImageCloudinaryService(),
  );
  locator.registerLazySingleton<VideoCloudStorageService>(
    () => VideoCloudinaryService(),
  );

  locator.allowReassignment = true;
}
