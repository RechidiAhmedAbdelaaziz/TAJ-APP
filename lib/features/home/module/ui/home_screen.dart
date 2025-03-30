import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/logo.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/about/config/about_us_navigator.dart';
import 'package:taj_elsafa/features/auth/logic/auth.cubit.dart';
import 'package:taj_elsafa/features/documents/config/documents_navigator.dart';
import 'package:taj_elsafa/features/home/data/models/banner_model.dart';
import 'package:taj_elsafa/features/notification/modules/multinotification/ui/widgets/notification_button.dart';
import 'package:taj_elsafa/features/profile/config/profile_navigator.dart';
import 'package:taj_elsafa/features/realstates/config/real_states_navigator.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

part 'widgets/app_bar.dart';
part 'widgets/banners.dart';
part 'widgets/buttons.dart';
part 'widgets/side_bar.dart';
part 'widgets/drawer_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const _AppBar(),
      drawer: const _SideBar(),
      body: Column(
        children: [
          heightSpace(21),

          const _Banners(),
          heightSpace(15),

          _buildText(
            'ChooseRequirement'.tr(context),
            AppTextStyles.medium.copyWith(color: AppColors.black),
          ),
          heightSpace(24),

          Expanded(
            child: _buildText(
              'ChooseRequirementDesc'.tr(context),
              AppTextStyles.medium.copyWith(color: AppColors.black),
              textAlign: TextAlign.justify,
            ),
          ),
          heightSpace(8),

          const _Buttons(),
          heightSpace(140),

          _buildText(
            "typesetting, remaining essentially  versions of".tr(
              context,
            ),
            AppTextStyles.normal.copyWith(color: AppColors.black),
          ),
          heightSpace(20),
        ],
      ),
    );
  }

  Widget _buildText(
    String text,
    TextStyle style, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Text(text, textAlign: textAlign, style: style),
    );
  }
}
