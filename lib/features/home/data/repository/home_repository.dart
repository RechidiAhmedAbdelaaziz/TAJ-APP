import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/home_api.dart';

@lazySingleton
class HomeRepo extends NetworkRepository {
  final _homeApi = locator<HomeApi>();
}
