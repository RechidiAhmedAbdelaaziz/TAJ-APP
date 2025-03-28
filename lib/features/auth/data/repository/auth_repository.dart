import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:taj_elsafa/core/network/types/api_result.type.dart';
import 'package:taj_elsafa/features/auth/data/dto/login.dto.dart';
import 'package:taj_elsafa/features/auth/data/dto/reset_password_dto.dart';
import '../source/auth_api.dart';

@lazySingleton
class AuthRepo extends NetworkRepository {
  final _authApi = locator<AuthApi>();

  RepoResult<AuthTokens> login(LoginDTO dto) async {
    // return tryApiCall( //TODO implement after api is ready
    //   apiCall: () async => _authApi.login(await dto.toMap()),
    //   onResult: (json) => AuthTokens.fromJson(json),
    // );

    return ApiResult.success(
      AuthTokens(accessToken: '', refreshToken: ''),
    );
  }

  RepoResult<void> forgotPassword(ForgotPasswordDto dto) async {
    // return tryApiCall(
    //   apiCall: () async => _authApi.forgotPassword(await dto.toMap()),
    //   onResult: (_) {},
    // );

    return ApiResult.success(null);
  }
}
