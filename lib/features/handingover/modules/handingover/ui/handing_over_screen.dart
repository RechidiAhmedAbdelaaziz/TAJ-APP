import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/shared/widgets/media_field.dart';
import 'package:taj_elsafa/core/shared/widgets/signature_pad.dart';
import 'package:taj_elsafa/core/shared/widgets/states_page.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notes/config/notes_navigator.dart';

import '../logic/handing_over_cubit.dart';

class HandingOverScreen extends StatelessWidget {
  const HandingOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (HandingOverCubit cubit) => cubit.isLoading || !cubit.isLoaded,
    );
    return StatesPage(
      title: "Handing Over",
      isLoading: isLoading,

      builder: (context, state) {
        final handingOver = context.select(
          (HandingOverCubit cubit) => cubit.handingOver,
        );

        return SingleChildScrollView(
          child: Column(
            children: [
              if (handingOver.hasNotes)
                _buildShowNotesButton(context),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 24.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...handingOver.conditions.map(
                      (condition) => Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        color: Color(0x999F9F9F),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${handingOver.conditions.indexOf(condition) + 1}- ${condition.title}',
                              style: AppTextStyles.large.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            heightSpace(16),

                            if (condition.points != null)
                              ...condition.points!.map(
                                (point) => Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: 8.w,
                                    bottom: 4.h,
                                  ),
                                  child: Text(
                                    '- $point',
                                    style: AppTextStyles.normal
                                        .copyWith(
                                          color: AppColors.black,
                                        ),
                                  ),
                                ),
                              ),

                            heightSpace(24),

                            MultiMediaField(
                              controller: condition.medias,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },

      bottomNavigationBar:
          (context) =>
              context.select(
                    (HandingOverCubit cubit) =>
                        cubit.isLoaded &&
                        cubit.handingOver.isVerified,
                  )
                  ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 35.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x40000000),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Row(
                      spacing: 12.w,
                      children: [
                        Expanded(
                          child: AppButton(
                            text: 'Send A Note'.tr(context),
                            textStyle: AppTextStyles.normal.copyWith(
                              color: AppColors.white,
                            ),
                            borderColor: AppColors.white,
                            onPressed:
                                () => context.to(
                                  NotesNavigator.create(),
                                ),
                          ),
                        ),

                        Expanded(
                          child: AppButton(
                            text: 'Recive'.tr(context),
                            textStyle: AppTextStyles.normal.copyWith(
                              color: AppColors.white,
                            ),
                            borderColor: AppColors.white,
                            color: Color(0x40FFFFFF),

                            onPressed:
                                () => context.dialogWith<bool>(
                                  child: SignaturePad(),
                                  onResult: (_) {
                                    context.showSuccessDialog(
                                      'The property has been successfully received.'
                                          .tr(context),
                                    );
                                  },
                                ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : SizedBox.shrink(),
    );
  }

  Widget _buildShowNotesButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      color: Color(0x999F9F9F),
      child: AppButton(
        text: 'Attached notes'.tr(context),
        textStyle: AppTextStyles.normal.copyWith(
          color: AppColors.white,
        ),
        color: AppColors.buttonColor,
        onPressed: () => context.to(NotesNavigator.notes()),
      ),
    );
  }
}
