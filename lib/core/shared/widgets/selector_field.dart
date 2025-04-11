import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/widgets/text_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';

class AppSelectorField<T> extends StatelessWidget {
  final EditingController<T> controller;

  final String label;

  final List<T> Function(BuildContext context) items;

  final Widget Function(BuildContext context, Widget checkBox, T item)
  builder;

  const AppSelectorField({
    super.key,
    required this.label,
    required this.controller,
    required this.items,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final items = this.items(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.medium.copyWith(
            color: AppColors.black,
          ),
        ),
        heightSpace(8),

        Wrap(
          spacing: 20.w,
          runSpacing: 8.h,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...items.map(
              (item) => builder(context, _buildCheckBox(item), item),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckBox(T item) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, value, _) {
        final selected = value == item;
        return InkWell(
          onTap: () => controller.setValue(item),
          child: Container(
            width: 24.r,
            height: 24.r,
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 4.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child:
                selected
                    ? CircleAvatar(
                      backgroundColor: Color(0xFF7FD1AE),
                      radius: 8.r,
                    )
                    : null,
          ),
        );
      },
    );
  }
}
