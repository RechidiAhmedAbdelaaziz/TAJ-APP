import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

import '../configs/auth_cache.dart';

part 'auth.state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final _authCache = locator<AuthCache>();

  AuthCubit() : super(AuthState.initial());

  Future<bool> get isAuthenticated async =>
      await _authCache.isAuthenticated;

  void checkAuth() async {
    await isAuthenticated
        ? emit(state._authenticated())
        : emit(state._unauthenticated());
  }

  void authenticate([String? token, UserModel? user]) async {
    if (token != null && user != null) {
      await Future.wait([
        _authCache.setToken(token),
        _authCache.setUser(user),
      ]);
      return emit(state._authenticated());
    }
    
    await _authCache.setLocalAuth(true);

    emit(state._authenticated());
  }

  void logout() async {
    emit(state._unauthenticated());
    await Future.wait([
      _authCache.clearTokens(),
      _authCache.setLocalAuth(false),
    ]);

    locator<AppRouter>().routerConfig.go(AppRoutes.login);
  }
}
