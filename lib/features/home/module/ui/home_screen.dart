import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/localization/localization_button.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/logo.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/about/config/about_us_navigator.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/auth/logic/auth.cubit.dart';
import 'package:taj_elsafa/features/documents/config/documents_navigator.dart';
import 'package:taj_elsafa/features/handingover/config/handing_over_navigator.dart';
import 'package:taj_elsafa/features/home/data/models/banner_model.dart';
import 'package:taj_elsafa/features/notification/modules/multinotification/ui/widgets/notification_button.dart';
import 'package:taj_elsafa/features/profile/config/profile_navigator.dart';
import 'package:taj_elsafa/features/realstates/config/real_states_navigator.dart';
import 'package:taj_elsafa/features/request/config/request_navigator.dart';
import 'package:taj_elsafa/features/ticket/config/ticket_navigator.dart';
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.alertDialog(
          title: 'Exit'.tr(context),
          content: 'Are you sure you want to exit?'.tr(context),
          okText: 'Exit'.tr(context),
          onConfirm: () async {
            if (didPop) context.pop();
            exit(0);
          },
        );
      },

      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const _AppBar(),
        drawer: const _SideBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              heightSpace(21),

              const _Banners(),
              heightSpace(15),

              _buildText(
                'ChooseRequirement'.tr(context),
                AppTextStyles.medium.copyWith(color: AppColors.black),
              ),
              heightSpace(24),

              _buildText(
                'ChooseRequirementDesc'.tr(context),
                AppTextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.justify,
              ),
              heightSpace(72),

              const _Buttons(),
              heightSpace(85),

              _buildText(
                "typesetting, remaining essentially  versions of".tr(
                  context,
                ),
                AppTextStyles.normal.copyWith(color: AppColors.black),
              ),
              heightSpace(20),
            ],
          ),
        ),
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
