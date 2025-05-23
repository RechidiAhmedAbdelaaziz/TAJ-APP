import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData? suffixIcon;
  final Widget? prefixIcon;

  final void Function()? onPressed;

  final bool Function(BuildContext context)? isLoading;

  final Color? color;
  final Color? borderColor;
  final TextStyle textStyle;

  const AppButton({
    super.key,
    required this.text,
    this.suffixIcon,
    this.onPressed,
    this.isLoading,
    this.color,
    this.borderColor,
    this.prefixIcon,
    required this.textStyle,
  });

  factory AppButton.primary({
    required String text,
    IconData? suffixIcon,
    void Function()? onPressed,
    bool Function(BuildContext context)? isLoading,
  }) => AppButton(
    text: text,
    suffixIcon: suffixIcon,
    onPressed: onPressed,
    isLoading: isLoading,
    color: AppColors.greyDark,
    textStyle: AppTextStyles.primaryButton,
    borderColor: AppColors.white,
  );

  factory AppButton.secondary({
    required String text,
    IconData? suffixIcon,
    void Function()? onPressed,
    bool Function(BuildContext context)? isLoading,
  }) => AppButton(
    text: text,
    suffixIcon: suffixIcon,
    onPressed: onPressed,
    isLoading: isLoading,
    borderColor: AppColors.greyDark,
    textStyle: AppTextStyles.secondaryButton,
  );

  factory AppButton.hyperLink({
    required String text,
    IconData? suffixIcon,
    void Function()? onPressed,
    bool Function(BuildContext context)? isLoading,
  }) => AppButton(
    text: text,
    suffixIcon: suffixIcon,
    onPressed: onPressed,
    isLoading: isLoading,
    textStyle: AppTextStyles.link,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,

      child: Container(
        // width: double.infinity,
        padding: EdgeInsets.symmetric(
          // horizontal: 16.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          spacing: 12.w,
          children: [
            //show prefixIcon if it is not null
            if (prefixIcon != null) ...[prefixIcon!],

            Text(text, style: textStyle),

            //show loading indicator if isLoading is true, else show suffixIcon if it is not null
            if (isLoading?.call(context) == true)
              SizedBox(
                // width: 16.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  constraints: BoxConstraints(
                    minHeight: 25.r,
                    minWidth: 25.r,
                  ),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textStyle.color ?? AppColors.white,
                  ),
                ),
              )
            else if (suffixIcon != null) ...[
              widthSpace(10),
              SizedBox(
                child: Icon(
                  suffixIcon,
                  color: textStyle.color ?? AppColors.white,
                  size: 25.r,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
