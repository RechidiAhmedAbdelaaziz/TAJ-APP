import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/extension/xfile_extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/image_field.dart';
import 'package:taj_elsafa/core/shared/widgets/selector_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';

class SignaturePad extends StatelessWidget {
  final imageController = EditingController<ImageDTO>();
  SignaturePad({super.key});

  final _options = EditingController<String>('Draw Signature');

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: AppColors.buttonColor,
  );

  Future<void> _exportSignature() async {
    if (_options.value == 'Upload Image') return;

    if (_controller.isNotEmpty) {
      final Uint8List? data = await _controller.toPngBytes();

      if (data != null) {
        final directory = await getTemporaryDirectory();
        final filePath =
            '${directory.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File(filePath);
        await file.writeAsBytes(data);

        imageController.setValue(XFile(file.path).toMediaDTO());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Signature'),
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 24.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
            vertical: 44.h,
          ),
          color: Color(0xFFFAF7FF),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Your Signature',
                  style: AppTextStyles.medium.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              heightSpace(32),

              AppSelectorField(
                label: 'Signature Type:',
                controller: _options,
                // select between two options : upload image or draw signature
                items: (_) => ['Draw Signature', 'Upload Image'],
                onChanged: (value) {
                  if (value != 'Draw Signature') _controller.clear();

                  if (value != 'Upload Image') {
                    imageController.clear();
                  }
                },
                builder:
                    (context, checkBox, item) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        checkBox,
                        widthSpace(4),
                        Text(
                          item,
                          style: AppTextStyles.normal.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
              ),
              heightSpace(24),

              ValueListenableBuilder(
                valueListenable: _options,
                builder: (context, value, _) {
                  return value == 'Draw Signature'
                      ? Stack(
                        children: [
                          Signature(
                            controller: _controller,
                            height: 206.h,
                            width: double.infinity,
                            backgroundColor: AppColors.buttonColor,
                          ),

                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.clear_outlined,
                                color: Colors.red,
                                size: 30.r,
                              ),
                              onPressed: () => _controller.clear(),
                            ),
                          ),
                        ],
                      )
                      : MediaField(
                        imageController: imageController,
                        height: 206.h,
                        width: double.infinity,
                      );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 24.h,
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
        child: AppButton(
          text: 'Sign',
          textStyle: AppTextStyles.medium.copyWith(
            color: AppColors.white,
          ),
          borderColor: AppColors.black,

          onPressed: () async {
            await _exportSignature();
            context.back(true);
          },
        ),
      ),
    );
  }
}
