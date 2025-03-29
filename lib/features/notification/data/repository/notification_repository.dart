
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/notification_api.dart';



@lazySingleton
class NotificationRepo extends NetworkRepository {
  final _notificationApi = locator<NotificationApi>();
}
