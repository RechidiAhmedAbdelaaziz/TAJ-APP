import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.r,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(AppIcons.school, color: AppColors.primary, size: 64.r),
        Text(
          'Dirasaty',
          style: AppTextStyles.h3.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
