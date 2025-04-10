import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/extension/xfile_extension.dart';
import 'package:taj_elsafa/core/services/filepicker/filepick.service.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/indicated_pagview.dart';
import 'package:taj_elsafa/core/shared/widgets/zoomable_widget.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';

class MultiMediaField<T extends MediaDTO> extends StatelessWidget {
  final ListEditingController<T> controller;

  final Widget? note;

  final int maxMedia;

  const MultiMediaField({
    super.key,
    required this.controller,
    this.note,
    this.maxMedia = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildUploadButton(),
        heightSpace(22),

        if (note != null) ...[note!, heightSpace(40)],

        ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, medias, child) {
            return SizedBox(
              height: 280.h,
              child: IndicatedPagview(
                pages: [
                  ...medias.map(
                    (dto) => Stack(
                      children: [
                        ZoomableWidget(
                          child: dto.buildWidget(
                            width: double.infinity,
                            height: 280.h,
                          ),
                        ),

                        PositionedDirectional(
                          bottom: 8.h,
                          end: 8.w,
                          child: InkWell(
                            onTap: () {
                              controller.removeValue(dto);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  100.r,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x40000000),
                                    blurRadius: 4.r,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.delete,
                                size: 24.r,
                                color: AppColors.red,
                              ),
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
        ),
      ],
    );
  }

  Widget _buildUploadButton() {
    return AppButton(
      text: 'Attach File',
      textStyle: AppTextStyles.normal.copyWith(
        color: AppColors.white,
      ),
      color: Color(0x999F9F9F),
      prefixIcon: Icon(Icons.camera_alt, color: Color(0xff7FD1AE)),
      onPressed: _uploadMedia,
    );
  }

  void _uploadMedia() async {
    if (controller.value.length >= maxMedia) return;
    final xfile = await locator<MediaPickerService>().pickFile();
    if (xfile != null) controller.addValue(xfile.toMediaDTO<T>());
  }
}
