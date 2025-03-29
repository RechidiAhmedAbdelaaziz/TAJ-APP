import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notification/data/models/notification_model.dart';

final _notifications = [
  NotificationModel(
    id: '1',
    title: 'Ticket No.10',
    body:
        'Maintenance work was carried out and completed required. All the mentioned problems were fixed.',
    date: DateTime.now(),
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcRoJSK_GJ42SeBNQSRy2dUhmgsXtMTB66sQ&s",
  ),
  NotificationModel(
    id: '2',
    title: 'Ticket No.11',
    body:
        'Maintenance work was carried out and completed required. All the mentioned problems were fixed.',
    date: DateTime.now(),
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXe2zFagy5yWp05gwX_VBZC1wxoH7uOAKeGA&s",
  ),
];

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w,
            ),
            margin: EdgeInsets.only(
              top: 16.h,
              bottom: 4.h,
              left: 21.w,
              right: 21.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5).r,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${notification.date?.toDayMonthYear()}',
                      style: AppTextStyles.normal.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '${notification.date?.toHourMinute()}',
                      style: AppTextStyles.normal.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                heightSpace(16),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12.w,
                  children: [
                    _buildNotificationImage(notification),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.title ?? '',
                            style: AppTextStyles.medium.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Text(
                            notification.body ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.small.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotificationImage(NotificationModel notification) {
    return Container(
      width: 68.r,
      height: 68.r,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(notification.imageUrl ?? ''),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
