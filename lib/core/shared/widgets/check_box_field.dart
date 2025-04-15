import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';

class AppCheckBoxField extends StatelessWidget {
  final BooleanEditingController controller;

  final String label;

  final String? Function(bool?)? validator;

  const AppCheckBoxField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, _) {
            return InkWell(
              onTap: controller.toggle,
              child: buildCheckBox(value),
            );
          },
        ),
        widthSpace(8),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.normal.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCheckBox(bool isSelected) {
    return Container(
      width: 20.r,
      height: 20.r,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: isSelected ? Color(0xff7FD1AE) : AppColors.grey,
          width: 2.r,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected ? Color(0xff7FD1AE) : Color(0x40000000),
            blurRadius: 4.r,
          ),
        ],
      ),
      alignment: Alignment.center,
      child:
          isSelected
              ? Icon(
                Icons.check,
                size: 16.r,
                color: Color(0xff7FD1AE),
              )
              : null,
    );
  }
}
