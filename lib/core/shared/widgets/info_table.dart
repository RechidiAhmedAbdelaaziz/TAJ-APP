import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoColumn<T> {
  final int flex;
  final Widget header;
  final Widget Function(T item) itemBuilder;

  InfoColumn({
    required Widget header,
    required this.itemBuilder,
    this.flex = 1,
  }) : header = Padding(
         padding: EdgeInsets.symmetric(
           vertical: 10.h,
           horizontal: 10.w,
         ),
         child: header,
       );
}

class InfoTable<T> extends StatelessWidget {
  final List<InfoColumn<T>> columns;
  final List<T> items;

  final Color backgroundColor;

  const InfoTable({
    super.key,
    required this.columns,
    required this.items,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Column(
        children: [
          Row(
            children:
                columns
                    .map(
                      (column) => Expanded(
                        flex: column.flex,
                        child: column.header,
                      ),
                    )
                    .toList(),
          ),
          const Divider(),

          ...items.map(
            (item) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                  child: Row(
                    children:
                        columns
                            .map(
                              (column) => Expanded(
                                flex: column.flex,
                                child: column.itemBuilder(item),
                              ),
                            )
                            .toList(),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
