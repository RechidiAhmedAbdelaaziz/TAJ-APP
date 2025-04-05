import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

class PdfView extends StatelessWidget {
  final String title;
  final Widget _pdf;

  PdfView.fromUrl({
    super.key,
    required this.title,
    required String url,
  }) : _pdf = PDF(swipeHorizontal: true).cachedFromUrl(
         url,
         placeholder:
             (progress) => Center(
               child: CircularProgressIndicator(
                 value: progress / 100,
                 color: AppColors.primary,
               ),
             ),
         errorWidget:
             (error) => Center(
               child: Text(
                 'Error loading PDF',
                 style: AppTextStyles.normal.copyWith(
                   color: AppColors.red,
                 ),
               ),
             ),
       );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder:
                  (_) => Scaffold(
                    appBar: AppBar(title: Text(title)),
                    body: _pdf,
                  ),
            ),
          ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.greyDark,
          borderRadius: BorderRadius.circular(5).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.w,
          children: [
            SvgPicture.asset(Assets.icons.pdfIcon),
            Text(
              'View File',
              style: AppTextStyles.normal.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
