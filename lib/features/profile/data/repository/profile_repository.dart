import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/profile/data/dto/update_password_dto.dart';
import 'package:taj_elsafa/features/profile/data/dto/user_dto.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

import '../source/profile_api.dart';

@lazySingleton
class ProfileRepo extends NetworkRepository {
  final _profileApi = locator<ProfileApi>();

  RepoResult<UserModel> updateProfile(UpdateUserDto dto) async {
    return tryApiCall(
      apiCall:
          () async => _profileApi.updateProfile(await dto.toMap()),
      onResult: (response) => UserModel.fromJson(response.data!),
    );
  }

  RepoResult<UserModel> getProfile() async {
    return tryApiCall(
      apiCall:
          () async => await _profileApi.getProfile(
            userId: locator<AuthCache>().user!.id!,
          ),
      onResult: (response) {
        
        return UserModel.fromJson(response.data!);
      },
    );
  }

  RepoResult<void> changePassword(UpdatePasswordDto dto) async {
    return tryApiCall(
      apiCall:
          () async => _profileApi.changePassword(await dto.toMap()),
      onResult: (response) {
        return;
      },
    );
  }
}
