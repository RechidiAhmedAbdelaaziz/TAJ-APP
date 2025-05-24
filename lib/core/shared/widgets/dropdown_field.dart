import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDownField<T> extends StatelessWidget {
  final EditingController<T> controller;
  final T? initialValue;

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
    this.initialValue,
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
                child: DropdownSearch<T>(
                  itemAsString: itemToString,

                  selectedItem: initialValue,

                  // compareFn: (item1, item2) {
                  //   if (item1 == null || item2 == null) return false;
                  //   return item1.toString() == item2.toString();
                  // },
                  autoValidateMode:
                      AutovalidateMode.onUserInteraction,

                  suffixProps: DropdownSuffixProps(
                    dropdownButtonProps: DropdownButtonProps(
                      iconOpened: Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.black,
                        size: 32.r,
                      ),
                      iconClosed: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.black,
                        size: 32.r,
                      ),
                    ),
                  ),
                  items: (filter, loadProps) => itemsBuilder(context),

                  onChanged:
                      (value) =>
                          value != null
                              ? controller.setValue(value)
                              : controller.clear(),

                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: AppTextStyles.medium.copyWith(
                      color: AppColors.black,
                    ),

                    decoration: InputDecoration(
                      error: state.hasError ? const SizedBox() : null,

                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2).r,
                        borderSide: BorderSide(color: AppColors.grey),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2).r,
                        borderSide: BorderSide(color: AppColors.grey),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2).r,
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2).r,
                        borderSide: BorderSide(color: AppColors.red),
                      ),
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
      ),
    );
  }
}
