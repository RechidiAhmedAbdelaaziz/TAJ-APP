import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  final Widget? suffixIcon;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final List<String>? autofillHints;

  final bool obscureText;

  final Color fillColor;

  const AppInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    this.keyboardType,
    this.autofillHints,
    this.fillColor = AppColors.white,
  });

  static Widget password({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?)? validator,
  }) => _PasswordFormField(
    controller: controller,
    hintText: hintText,
    validator: validator,
  );

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) => validator?.call(controller.text),
      autovalidateMode: AutovalidateMode.onUnfocus,
      builder: (state) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),

              child: TextField(
                controller: controller,
                obscureText: obscureText,

                keyboardType: keyboardType,
                autofillHints: autofillHints,

                style: AppTextStyles.medium.copyWith(
                  color: AppColors.black,
                ),

                maxLines:
                    keyboardType == TextInputType.multiline
                        ? null
                        : 1,

                cursorColor: AppColors.primary,

                inputFormatters: inputFormatters,

                decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: true,

                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),

                  isCollapsed: true,
                  isDense: true,

                  hintText: hintText,

                  error: state.hasError ? SizedBox.shrink() : null,

                  suffix: suffixIcon,

                  hintStyle: AppTextStyles.medium.copyWith(
                    color: AppColors.greyDark,
                  ),

                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5).r,
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5).r,
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5).r,
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8).r,
                  ),
                ),
              ),
            ),

            if (state.hasError) ...[
              heightSpace(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widthSpace(8),
                  Icon(
                    Icons.error_outline,
                    color: AppColors.red,
                    size: 20.r,
                  ),
                  widthSpace(8),
                  Expanded(
                    child: Text(
                      state.errorText!,
                      style: AppTextStyles.error,
                    ),
                  ),
                  widthSpace(8),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}

class _PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const _PasswordFormField({
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<_PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      controller: widget.controller,
      hintText: widget.hintText,
      validator: widget.validator,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.password],
      fillColor: AppColors.white,

      suffixIcon: InkWell(
        child: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.greyDark,
          size: 22.r,
        ),
        onTap: () => setState(() => obscureText = !obscureText),
      ),
    );
  }
}
