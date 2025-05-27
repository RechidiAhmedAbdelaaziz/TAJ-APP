import 'dart:async';
// import 'package:web/web.dart' as html;
import 'package:image_picker/image_picker.dart';

part 'web_filepicker.dart';
part 'mobile_filepicker.dart';

abstract class FilePickerService<T> {
  Future<T?> pickFile();

  Future<List<T>> pickFiles([int? limit]);
}

abstract class MediaPickerService
    extends FilePickerService<XFile> {}
