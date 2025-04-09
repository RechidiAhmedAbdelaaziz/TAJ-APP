import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

class AuthScreen extends StatelessWidget {
  final String title;

  final Widget form;

  final AppButton submitButton;

  final Widget? oAuthButtons;

  final bool backButton;

  const AuthScreen({
    super.key,
    required this.title,
    required this.form,
    required this.submitButton,
    this.oAuthButtons,
    this.backButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xCCFFFFFF),
        body: Stack(
          children: [
            Center(
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
                      heightSpace(25),

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

            if (backButton)
              PositionedDirectional(
                top: 32.h,
                start: 25.w,
                child: InkWell(
                  onTap: () => context.back(),
                  child: SvgPicture.asset(Assets.icons.arrowBack),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
