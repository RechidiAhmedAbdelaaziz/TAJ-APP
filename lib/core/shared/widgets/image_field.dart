import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/services/filepicker/filepick.service.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/core/themes/colors.dart';

class ImageField extends StatelessWidget {
  final EditingController<ImageDTO> imageController;

  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  final Widget uploadIcon;

  ImageField({
    super.key,
    EditingController<ImageDTO>? imageController,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 10,
    this.borderWidth = 2,
    this.uploadIcon = const Icon(Icons.upload),
    this.borderColor = AppColors.greyDark,
  }) : imageController =
           imageController ?? EditingController<ImageDTO>();

  void _uploadImage() async {
    final pickedImage =
        await locator<ImagePickerService>().pickFile();

    if (pickedImage != null) {
      imageController.setValue(pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: imageController,
      builder: (_, ImageDTO? imageDto, __) {
        return InkWell(
          onTap: _uploadImage,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
              image:
                  imageDto != null
                      ? DecorationImage(
                        image: imageDto.image,
                        fit: BoxFit.contain,
                      )
                      : null,
            ),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: InkWell(onTap: _uploadImage, child: uploadIcon),
            ),
          ),
        );
      },
    );
  }
}
