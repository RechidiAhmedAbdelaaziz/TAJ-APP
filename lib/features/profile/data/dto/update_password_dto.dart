import 'package:flutter/widgets.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';

class UpdatePasswordDto extends FormDTO {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'old_password': oldPasswordController.text,
      'new_password': newPasswordController.text,
      'confirm_password': confirmPasswordController.text,
    };
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
