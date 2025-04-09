import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/profile/data/dto/update_password_dto.dart';

final _dto = UpdatePasswordDto();

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text('ChangePassword'.tr(context)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Form(
            key: _dto.formKey,
            child: Column(
              children: [
                heightSpace(45),

                AppInputField.password(
                  controller: _dto.oldPasswordController,
                  hintText: 'OldPassword'.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'RequiredField'.tr(context);
                    }
                    return null;
                  },
                ),
                heightSpace(15),

                AppInputField.password(
                  controller: _dto.newPasswordController,
                  hintText: 'NewPassword'.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'RequiredField'.tr(context);
                    }
                    return null;
                  },
                ),
                heightSpace(15),

                AppInputField.password(
                  controller: _dto.confirmPasswordController,
                  hintText: 'ConfirmPassword'.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'RequiredField'.tr(context);
                    }
                    if (value != _dto.newPasswordController.text) {
                      return 'PasswordNotMatch'.tr(context);
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 25.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.grey,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.25),
              blurRadius: 10.r,
            ),
          ],
        ),
        child: AppButton(
          text: 'ChangePassword'.tr(context),
          textStyle: AppTextStyles.primaryButton.copyWith(
            color: AppColors.white,
          ),
          color: AppColors.buttonColor,
          onPressed: () {
            context.showSuccessDialog('PasswordUpdated'.tr(context));
          }, //TODO : call update user logic
        ),
      ),
    );
  }
}
