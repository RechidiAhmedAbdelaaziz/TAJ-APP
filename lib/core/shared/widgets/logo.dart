import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.images.logo.image(
      width: 92.w,
      height: 56.h,
      fit: BoxFit.cover,
    );
  }
}
