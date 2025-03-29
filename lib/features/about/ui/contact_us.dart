import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/shared/widgets/logo.dart';
import 'package:taj_elsafa/core/shared/widgets/text_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            heightSpace(20),

            ...{
              "Phone Number": "00962799263003",

              "Site":
                  "Prince Rashid District, King Abdullah Street next to Zain, Amman, Jordan",

              "E-mail": "info@tajalsafa.com",
            }.entries.map((e) => _buildInfo(e.key, e.value)),

            _buildSocialMedia(),

            _buildInfo("Website", "www.Tajalsafa.com"),

            _buildSuggestionSubmission(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionSubmission(BuildContext context) {
    return _buildInfoSeparator(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Suggestions",
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),
          heightSpace(8),
          AppButton.secondary(
            text: "Submit Suggestions",
            suffixIcon: Icons.arrow_right,
            onPressed: () {
              context.dialogWith<bool>(
                child: SubmitSuggestions(),
                onResult: (_) {
                  context.showSuccessDialog(
                    "Thank you for your suggestion",
                  );
                },
              );
            },
          ),

          heightSpace(10),
          const Divider(),
          heightSpace(16),
        ],
      ),
    );
  }

  Widget _buildSocialMedia() {
    return _buildInfoSeparator(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Follow Us",
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),
          heightSpace(4),
          Row(
            children: [
              ...{
                Assets.icons.twitter: "https://twitter.com/",
                Assets.icons.facebook: "https://www.facebook.com/",
                Assets.icons.instagram: "https://www.instagram.com/",
                Assets.icons.linkedin: "https://www.linkedin.com/",
                Assets.icons.youtub: "https://www.youtube.com/",
              }.entries.map((e) => _buildIcon(e.key, e.value)),
            ],
          ),
          heightSpace(10),
          const Divider(),
          heightSpace(16),
        ],
      ),
    );
  }

  Widget _buildIcon(String icon, String link) {
    return InkWell(
      onTap: () {
        //TODO: Open the link in a web browser
      },
      child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 42.h),
      width: double.infinity,
      color: AppColors.grey,
      child: Center(child: AppLogo(width: 151.w, height: 92.h)),
    );
  }

  Widget _buildInfo(String title, String item) {
    return _buildInfoSeparator(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),
          heightSpace(4),
          Text(
            item,
            style: AppTextStyles.normal.copyWith(
              color: AppColors.blackLight,
            ),
          ),

          heightSpace(10),
          const Divider(),
          heightSpace(16),
        ],
      ),
    );
  }

  Widget _buildInfoSeparator(Widget info) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: info,
      ),
    );
  }
}

class SubmitSuggestions extends StatelessWidget {
  const SubmitSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5).r,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Submit Your Suggestions",
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),
          heightSpace(16),
          AppInputField(
            controller: TextEditingController(),
            hintText: "Your Suggestion Here",
            keyboardType: TextInputType.multiline,
          ),
          heightSpace(16),

          AppButton.primary(
            text: "Send",
            onPressed: () => context.back(true),
          ),
        ],
      ),
    );
  }
}
