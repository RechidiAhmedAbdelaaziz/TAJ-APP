import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/extension/snackbar.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/shared/widgets/logo.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),

        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            heightSpace(20),

            // ...{
            //   "Phone Number": "00962799263003",

            //   "Site":
            //       "Prince Rashid District, King Abdullah Street next to Zain, Amman, Jordan",

            //   "E-mail": "info@tajalsafa.com",
            // }
            _buildInfo(
              "Phone Number",
              "00962799263003",
              onTap:
                  () async => await launchUrl(
                    Uri.parse("tel:00962799263003"),
                  ),
            ),

            _buildInfo(
              "Site",
              "Prince Rashid District, King Abdullah Street next to Zain, Amman, Jordan",
            ),

            _buildInfo(
              "Email",
              "info@tajalsafa.com",
              onTap:
                  () async => await launchUrl(
                    Uri.parse("mailto:info@tajalsafa.com"),
                  ),
            ),

            _buildSocialMedia(context),

            _buildInfo(
              "Website",
              "www.Tajalsafa.com",
              onTap:
                  () async => await launchUrl(
                    Uri.parse("https://www.tajalsafa.com/"),
                  ),
            ),

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

          InkWell(
            onTap: () {
              context.dialogWith<bool>(
                child: SubmitSuggestions(),
                onResult: (_) {
                  context.showSuccessDialog(
                    "Thank you for your suggestion",
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(5).r,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.greyDark,
                    width: 4.r,
                  ),
                ),
              ),
              alignment: AlignmentDirectional.centerEnd,
              child: Icon(Icons.arrow_forward),
            ),
          ),

          heightSpace(10),
          const Divider(),
          heightSpace(16),
        ],
      ),
    );
  }

  Widget _buildSocialMedia(BuildContext context) {
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
          heightSpace(22),
          Row(
            spacing: 20.w,
            children: [
              ...{
                Assets.icons.twitter: "https://twitter.com/",
                Assets.icons.facebook: "https://www.facebook.com/",
                Assets.icons.youtub: "https://www.youtube.com/",
                Assets.icons.instagram: "https://www.instagram.com/",
                Assets.icons.linkedin: "https://www.linkedin.com/",
              }.entries.map(
                (e) => _buildIcon(e.key, e.value, context),
              ),
            ],
          ),
          heightSpace(22),
          const Divider(),
          heightSpace(16),
        ],
      ),
    );
  }

  Widget _buildIcon(
    AssetGenImage icon,
    String link,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse(link))) {
          context.showErrorSnackbar("Error opening link");
        }
      },
      child: icon.image(height: 18),
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

  Widget _buildInfo(
    String title,
    String item, {
    VoidCallback? onTap,
  }) {
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
          InkWell(
            onTap: onTap,
            child: Text(
              item,
              style: AppTextStyles.normal.copyWith(
                color: AppColors.blackLight,
              ),
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
      width: 371.w,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Color(0xFFFAF7FF),
        borderRadius: BorderRadius.circular(5).r,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Your Suggestions".tr(context),
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),
          heightSpace(35),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16).r,
            decoration: BoxDecoration(
              color: Color(0x9F9F9F99),
              borderRadius: BorderRadius.circular(5).r,
            ),
            child: TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Write Here ...",
                hintStyle: AppTextStyles.normal.copyWith(
                  color: AppColors.black,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          heightSpace(35),

          AppButton(
            text: "Send".tr(context),
            color: AppColors.buttonColor,
            textStyle: AppTextStyles.primaryButton.copyWith(
              color: AppColors.white,
            ),
            onPressed: () => context.back(true),
          ),
        ],
      ),
    );
  }
}
