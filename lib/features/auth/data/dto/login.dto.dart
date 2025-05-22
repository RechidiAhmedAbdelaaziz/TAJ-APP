import 'package:flutter/widgets.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/services/encryption/crypto_service.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';

class LoginDTO extends FormDTO {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value, BuildContext context) => null;

  String? validatePassword(String? value, BuildContext context) =>
      null;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'username': emailController.text,

      'password': locator<CryptoService>().encryptPassword(
        passwordController.text,
      ),

      "user_type": "customer",
    };
  }
}
