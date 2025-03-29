
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/real_states_api.dart';



@lazySingleton
class RealStatesRepo extends NetworkRepository {
  final _real_statesApi = locator<RealStatesApi>();
}
