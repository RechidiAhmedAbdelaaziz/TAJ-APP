import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/profile_api.dart';

@lazySingleton
class ProfileRepo extends NetworkRepository {
  final _profileApi = locator<ProfileApi>();
}
