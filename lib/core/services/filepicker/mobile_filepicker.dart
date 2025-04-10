part of 'filepick.service.dart';

class MobileFilePicker extends MediaPickerService {
  @override
  Future<XFile?> pickFile() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickMedia();
  }
}
