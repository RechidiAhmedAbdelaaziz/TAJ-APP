part of 'filepick.service.dart';

class WebFilePicker extends MediaPickerService {
  @override
  Future<XFile?> pickFile() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickMedia();
  }
}
