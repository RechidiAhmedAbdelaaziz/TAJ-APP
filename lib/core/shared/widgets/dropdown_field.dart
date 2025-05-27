import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDownField<T> extends StatelessWidget {
  final EditingController<T> controller;

  final String label;

  final List<T> Function(BuildContext context) itemsBuilder;
  final Widget Function(T)? itemToWidget;

  final String Function(T) itemToString;
  final String? Function(T?)? validator;
  final VoidCallback? onAdd;

  final bool isRequired;

  final double width;

  const AppDropDownField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.onAdd,
    this.isRequired = false,
    required this.itemsBuilder,
    required this.itemToString,
    this.itemToWidget,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FormField<T>(
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

                  if (onAdd != null) ...[
                    InkWell(
                      // Add button
                      onTap: onAdd,
                      child: Icon(
                        Icons.add_circle_outline,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
                child: CustomDropdown<T>(
                  items: itemsBuilder(context),
                  onChanged: (value) => controller.value = value,
                  initialItem: controller.value,
                  excludeSelected: true,
                  decoration: CustomDropdownDecoration(
                    expandedBorderRadius: BorderRadius.circular(12.r),
                    expandedBorder: Border(
                      bottom: BorderSide(color: AppColors.black),
                    ),
                    expandedShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 4.r,
                      ),
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 4.r,
                      ),
                    ],
                  ),

                  listItemBuilder: (_, item, isSelected, _) {
                    return itemToWidget != null
                        ? itemToWidget!(item)
                        : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.greyLight,
                            ),
                          ),

                          child: Text(
                            itemToString(item),
                            style: AppTextStyles.normal.copyWith(
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.black,
                            ),
                          ),
                        );
                  },
                  headerBuilder: (context, selectedItem, enabled) {
                    return Text(
                      selectedItem != null
                          ? itemToString(selectedItem)
                          : 'Select an option',
                      style: AppTextStyles.normal.copyWith(
                        color:
                            enabled
                                ? AppColors.black
                                : AppColors.greyDark,
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
      ),
    );
  }
}
