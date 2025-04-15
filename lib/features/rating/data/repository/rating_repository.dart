
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/rating_api.dart';



@lazySingleton
class RatingRepo extends NetworkRepository {
  final _ratingApi = locator<RatingApi>();
}
