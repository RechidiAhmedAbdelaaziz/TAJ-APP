import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

class LocalizationCubit extends Cubit<Locale?> {
  final _cacheService = locator<CacheService>();
  LocalizationCubit() : super(null) {
    init();
  }

  void init() {
    final langCode = _cacheService.getString('language') ?? 'en';
    emit(Locale(langCode));
  }

  void changeLanguage(String langCode) {
    _cacheService.setData('language', langCode);
    emit(Locale(langCode));
  }
}
