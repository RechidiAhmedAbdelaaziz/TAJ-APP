import 'package:flutter/material.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/notification/modules/multinotification/logic/multi_notification_cubit.dart';
import 'package:taj_elsafa/features/notification/modules/multinotification/ui/notifications_screen.dart';

class NotificationNavigator extends AppNavigatorBase {
  NotificationNavigator.notifications()
    : super(path: AppRoutes.notification);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.notification,
      builder: (context, state) {
        return BlocProvider(
          lazy: false,
          create:
              (context) =>
                  MultiNotificationCubit()..getNotifications(),
          child: const NotificationsScreen(),
        );
      },
    ),
  ];
}
