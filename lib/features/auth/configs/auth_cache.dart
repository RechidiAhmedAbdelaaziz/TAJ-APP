import 'dart:convert';

import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

abstract class AuthCache {
  final _cacheHelper = locator<CacheService>();

  Future<void> setToken(String token);
  Future<void> setUser(UserModel user) async {
    await _cacheHelper.setData('USER', json.encode(user.toJson()));
  }

  Future<String?> get token;
  UserModel? get user {
    final userJson = _cacheHelper.getMap('USER');
    if (userJson != null) {
      return UserModel.fromJson(userJson);
    }
    return null;
  }

  Future<void> clearTokens();

  Future<void> setLocalAuth(bool isAuthenticated) async {
    await _cacheHelper.setData('IS_AUTHENTICATED', isAuthenticated);
  }

  Future<bool> get getLocalAuth async =>
      await _cacheHelper.getBool('IS_AUTHENTICATED') ?? false;

  Future<bool> get isAuthenticated async =>
      await getLocalAuth || (await token) != null;
}

class SecureAuthCache extends AuthCache {
  @override
  Future<void> setToken(String token) async {
    await _cacheHelper.setSecuredString('API_TOKEN', token);
  }

  @override
  Future<String?> get token =>
      _cacheHelper.getSecuredString('API_TOKEN');

  @override
  Future<void> clearTokens() async {
    await Future.wait([_cacheHelper.removeSecuredData('API_TOKEN')]);
  }
}
