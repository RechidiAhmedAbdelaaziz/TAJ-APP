import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

import 'localization_cubit.dart';

class LocalizationButton extends StatelessWidget {
  const LocalizationButton({super.key});

  @override
  Widget build(BuildContext context) {
    

    return PopupMenuButton<String>(
      offset: Offset(0, 50.h),
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      icon: Row(
        children: [
          widthSpace(32),
          Expanded(
            child: Text(
              'Languages'.tr(context),
              style: AppTextStyles.normal,
            ),
          ),
          widthSpace(20),
          SvgPicture.asset(Assets.icons.arrowRight),
          widthSpace(32),
        ],
      ),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: 'en',
              child: _buildLangButton(
                text: 'English',
                onPressed: () {
                  Navigator.pop(context);
                  context.read<LocalizationCubit>().changeLanguage(
                    'en',
                  );
                },
              ),
            ),
            PopupMenuItem(
              value: 'ar',
              child: _buildLangButton(
                text: 'العربية',
                onPressed: () {
                  Navigator.pop(context);
                  context.read<LocalizationCubit>().changeLanguage(
                    'ar',
                  );
                },
              ),
            ),
          ],
      onSelected: (_) {},
    );
  }

  Widget _buildLangButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.normal.copyWith(
          color: AppColors.black,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
