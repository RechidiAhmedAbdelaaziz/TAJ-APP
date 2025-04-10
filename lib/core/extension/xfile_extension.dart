import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';

extension XfileExtension on XFile {
  T toMediaDTO<T extends MediaDTO>() {
    final mimeType = lookupMimeType(path);

    if (mimeType?.startsWith('image') ?? false) {
      return (kIsWeb
              ? WebImageDTO(file: this)
              : MobileImageDTO(file: this))
          as T;
    } else if (mimeType?.startsWith('video') ?? false) {
      return (kIsWeb
              ? WebVideoDTO(file: this)
              : MobileVideoDTO(file: this))
          as T;
    } else {
      throw Exception('Unsupported file type');
    }
  }
}
