import 'package:flutter/material.dart';

extension ResponsiveExtension on BoxConstraints {
  bool get isMobile => maxWidth < 600;

  bool get isTablet => maxWidth >= 600 && maxWidth < 1024;
  bool get isLandscape => maxWidth > maxHeight;
  bool get isPortrait => maxWidth < maxHeight;

  bool get isDesktop => maxWidth >= 1024;
}
