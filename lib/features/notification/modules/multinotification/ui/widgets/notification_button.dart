import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notification/config/notification_navigator.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.to(NotificationNavigator.notifications());
      },
      child: SizedBox(
        width: 40.r,
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              size: 32.r,
              color: AppColors.black,
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 12.r,
                child: Text(
                  '2',
                  style: AppTextStyles.normal.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
