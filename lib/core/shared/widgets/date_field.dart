import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDateField extends StatelessWidget {
  final EditingController<DateTime> controller;
  final String label;

  final DateTime firstDate;
  final DateTime lastDate;

  final String? Function(DateTime?)? validator;

  final bool isRequired;

  const AppDateField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    required this.firstDate,
    required this.lastDate,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      validator: (value) => validator?.call(controller.value),
      builder: (state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: label,
                      children: [
                        TextSpan(
                          text: isRequired ? ' *' : '',
                          style: AppTextStyles.medium.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    style: AppTextStyles.medium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            heightSpace(8),

            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return TextField(
                    readOnly: true,

                    controller: TextEditingController(
                      text: controller.value?.toDayMonthYear() ?? '',
                    ),

                    style: AppTextStyles.medium.copyWith(
                      color:
                          state.hasError
                              ? AppColors.red
                              : controller.value != null
                              ? AppColors.black
                              : AppColors.greyDark,
                    ),

                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: controller.value,
                        firstDate: firstDate,
                        lastDate: lastDate,
                      );

                      if (date != null) controller.setValue(date);
                    },

                    decoration: InputDecoration(
                      error:
                          state.hasError ? SizedBox.shrink() : null,

                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),

                      hintText: 'dd/mm/yyyy',

                      hintStyle: AppTextStyles.medium.copyWith(
                        color: AppColors.greyDark,
                      ),

                      suffixIcon: Icon(Icons.calendar_month_outlined),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(2).r,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(2).r,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                        borderRadius: BorderRadius.circular(2).r,
                      ),

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                        borderRadius: BorderRadius.circular(2).r,
                      ),
                    ),
                  );
                },
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
