import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  final String title;

  final Widget form;

  final AppButton submitButton;

  final Widget? oAuthButtons;

  const AuthScreen({
    super.key,
    required this.title,
    required this.form,
    required this.submitButton,
    this.oAuthButtons,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace(35),
                  Text(title, style: AppTextStyles.xLarge),
                  heightSpace(52),

                  form,
                  heightSpace(15),

                  submitButton,

                  if (oAuthButtons != null) ...[
                    heightSpace(35),
                    oAuthButtons!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
