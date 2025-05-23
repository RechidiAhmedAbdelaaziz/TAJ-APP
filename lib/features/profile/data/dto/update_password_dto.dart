import 'package:flutter/widgets.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/services/encryption/crypto_service.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';

class UpdatePasswordDto extends FormDTO {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Future<Map<String, dynamic>> toMap() async {
    final crypto = locator<CryptoService>();
    return {
      'user_id': locator<AuthCache>().user!.id,
      'current_password': crypto.encryptPassword(
        oldPasswordController.text,
      ),
      'new_password': crypto.encryptPassword(
        newPasswordController.text,
      ),
      'user_type': "customer",
    };
  }

  

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
