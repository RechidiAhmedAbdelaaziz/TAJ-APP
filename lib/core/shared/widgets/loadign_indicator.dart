import 'package:flutter/material.dart';
import 'package:taj_elsafa/core/themes/colors.dart';

class AppLoadignIndicator extends StatelessWidget {
  const AppLoadignIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        strokeWidth: 2.0,
      ),
    );
  }
}
