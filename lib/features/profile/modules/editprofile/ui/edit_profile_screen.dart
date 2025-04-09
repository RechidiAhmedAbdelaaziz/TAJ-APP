import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/image_field.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/profile/config/profile_navigator.dart';
import 'package:taj_elsafa/features/profile/data/dto/user_dto.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

final _dto = UpdateUserDto(
  UserModel(
    id: '1',
    name: 'Ahmed',
    altContactNumber: '0123456789',
    contactNumber: '0123456789',
    email: 'ahmed@gmail.com',
    imageUrl:
        'https://images.unsplash.com/photo-1628563694622-5a76957fd09c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
  ),
);

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text('EditProfile'.tr(context)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Form(
            key: _dto.formKey,
            child: Column(
              children: [
                heightSpace(45),

                _buildImageField(),
                heightSpace(40),

                ...[
                  AppInputField(
                    controller: _dto.nameController,
                    hintText: 'Name'.tr(context),
                    keyboardType: TextInputType.name,
                    fillColor: AppColors.white,
                  ),
                  AppInputField(
                    controller: _dto.contactNumberController,
                    hintText: 'ContactNumber'.tr(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    autofillHints: const [
                      AutofillHints.telephoneNumber,
                    ],
                    fillColor: AppColors.white,
                  ),
                  AppInputField(
                    controller: _dto.altContactNumberController,
                    hintText: 'AltContactNumber'.tr(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    autofillHints: const [
                      AutofillHints.telephoneNumber,
                    ],
                    fillColor: AppColors.white,
                  ),
                  AppInputField(
                    controller: _dto.emailController,
                    hintText: 'Email'.tr(context),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    fillColor: AppColors.white,
                  ),
                ].map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 17.h),
                    child: e,
                  ),
                ),
                heightSpace(35),

                AppButton(
                  text: 'ChangePassword'.tr(context),
                  textStyle: AppTextStyles.primaryButton.copyWith(
                    color: AppColors.white,
                  ),
                  color: AppColors.buttonColor,
                  onPressed:
                      () => context.to(
                        ProfileNavigator.changePassword(),
                      ),
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
          text: 'Save'.tr(context),
          textStyle: AppTextStyles.primaryButton.copyWith(
            color: AppColors.white,
          ),
          color: AppColors.buttonColor,
          onPressed: () {}, //TODO : call update user logic
        ),
      ),
    );
  }

  ImageField _buildImageField() {
    return ImageField(
      imageController: _dto.imageController,
      height: 105.r,
      width: 105.r,
      borderRadius: 500.r,
      borderWidth: 4.r,
      uploadIcon: Container(
        width: 25.r,
        height: 25.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(Icons.upload, color: Colors.black, size: 14.r),
      ),
    );
  }
}
