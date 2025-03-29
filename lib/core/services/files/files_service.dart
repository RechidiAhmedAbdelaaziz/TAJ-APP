import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FilesService {
  Future<Map<String, dynamic>> readJson(String path) async {
    try {
      final String response = await rootBundle.loadString(path);
      return json.decode(response);
    } catch (e) {
      throw Exception('Failed to load JSON file: $e');
    }
  }
}
