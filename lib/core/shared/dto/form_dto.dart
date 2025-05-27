import 'package:flutter/widgets.dart';

abstract class FormDTO {
  final formKey = GlobalKey<FormState>();

  bool validate() => formKey.currentState?.validate() ?? false;

  void dispose();

  Future<Map<String, dynamic>> toMap();
}
