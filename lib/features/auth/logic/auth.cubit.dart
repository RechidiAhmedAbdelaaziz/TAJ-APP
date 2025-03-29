import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';

import '../configs/auth_cache.dart';
import '../data/repository/auth_repository.dart';

part 'auth.state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final _authRepo = locator<AuthRepo>();
  final _authCache = locator<AuthCache>();

  AuthCubit() : super(AuthState.initial());

  Future<bool> get isAuthenticated async =>
      await _authCache.isAuthenticated;

  void checkAuth() async {
    await isAuthenticated
        ? emit(state._authenticated())
        : emit(state._unauthenticated());
  }

  void authenticate(AuthTokens tokens) async {
    await _authCache.setTokens(tokens);
    emit(state._authenticated());
  }

  Future<void> refreshToken() async {
    emit(state._loading());

    final refreshToken = await _authCache.refreshToken;

    if (refreshToken == null) return logout();

    //TODO implement refresh token logic
    // final result = await _authRepo.refreshToken(refreshToken);

    // result.when(
    //   success: (tokens) => authenticate(tokens),
    //   error: (error) {
    //     emit(state._error(error.message));
    //     logout();
    //   },
    // );
  }

  void logout() async {
    emit(state._unauthenticated());
    await _authCache.clearTokens();

    locator<AppRouter>().routerConfig.go(AppRoutes.login);
  }
}
