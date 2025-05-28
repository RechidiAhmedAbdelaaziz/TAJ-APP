import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/extension/snackbar.extension.dart';
import 'package:taj_elsafa/core/localization/localization_button.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/image_field.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/profile/config/profile_navigator.dart';

import '../logic/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (EditProfileCubit cubit) => cubit.state.isLoading || !cubit.state.isLoaded
    );

    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
        state.onSuccess(() {
          context.showSuccessSnackbar('ProfileUpdated'.tr(context));
        });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: Text('EditProfile'.tr(context)),
          centerTitle: true,
        ),
        body:
            isLoading
                ? const AppLoadignIndicator()
                : Builder(
                  builder: (context) {
                    final dto = context.read<EditProfileCubit>().dto;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
                        ),
                        child: Form(
                          key: dto.formKey,
                          child: Column(
                            children: [
                              heightSpace(45),

                              _buildImageField(dto.imageController),
                              heightSpace(40),

                              LocalizationButton(),
                              heightSpace(16),

                              ...[
                                AppInputField(
                                  controller: dto.nameController,
                                  hintText: 'Name'.tr(context),
                                  keyboardType: TextInputType.name,
                                  fillColor: AppColors.white,
                                ),
                                AppInputField(
                                  controller:
                                      dto.contactNumberController,
                                  hintText: 'ContactNumber'.tr(
                                    context,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly,
                                  ],
                                  keyboardType: TextInputType.phone,
                                  autofillHints: const [
                                    AutofillHints.telephoneNumber,
                                  ],
                                  fillColor: AppColors.white,
                                ),
                                AppInputField(
                                  controller:
                                      dto.altContactNumberController,
                                  hintText: 'AltContactNumber'.tr(
                                    context,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .digitsOnly,
                                  ],
                                  keyboardType: TextInputType.phone,
                                  autofillHints: const [
                                    AutofillHints.telephoneNumber,
                                  ],
                                  fillColor: AppColors.white,
                                ),
                                AppInputField(
                                  controller: dto.emailController,
                                  hintText: 'Email'.tr(context),
                                  keyboardType:
                                      TextInputType.emailAddress,
                                  autofillHints: const [
                                    AutofillHints.email,
                                  ],
                                  fillColor: AppColors.white,
                                ),
                              ].map(
                                (e) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 17.h,
                                  ),
                                  child: e,
                                ),
                              ),
                              heightSpace(35),

                              AppButton(
                                text: 'ChangePassword'.tr(context),
                                textStyle: AppTextStyles.primaryButton
                                    .copyWith(color: AppColors.white),
                                color: AppColors.buttonColor,
                                onPressed:
                                    () => context.toWith<bool>(
                                      ProfileNavigator.changePassword(),
                                      onResult:
                                          (value) => context
                                              .showSuccessDialog(
                                                'PasswordUpdated'.tr(
                                                  context,
                                                ),
                                              ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
            onPressed: context.read<EditProfileCubit>().save,
          ),
        ),
      ),
    );
  }

  MediaField _buildImageField(
    EditingController<ImageDTO> controller,
  ) {
    return MediaField(
      imageController: controller,
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
