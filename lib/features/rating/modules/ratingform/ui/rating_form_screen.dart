import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/rating/modules/ratingform/logic/rating_form_cubit.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

part 'widget/rating_form.dart';
part 'widget/stars_field.dart';

class RatingFormScreen extends StatelessWidget {
  const RatingFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (RatingFormCubit cubit) => cubit.isLoading || !cubit.isLoaded,
    );
    return BlocListener<RatingFormCubit, RatingFormState>(
      listener: (context, state) {
        state.onSuccess((rating) {
          context.back(rating);
          context.showSuccessDialog('Maintenance work is completed');
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rating'),
          leading: AppBackButton(),
        ),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.ratingBackground.provider(),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ConditionalBuilder(
              condition: !isLoading,
              builder: (_) => const _Form(),
              fallback: (_) => AppLoadignIndicator(),
            ),
          ),
        ),

        bottomNavigationBar: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: 24.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            boxShadow: [
              BoxShadow(
                color: const Color(0x40000000),
                blurRadius: 10.r,
              ),
            ],
          ),
          child: AppButton(
            text: 'Send Review',
            textStyle: AppTextStyles.normal.copyWith(
              color: AppColors.white,
            ),
            borderColor: AppColors.white,
            isLoading:
                (context) => context.select(
                  (RatingFormCubit cubit) => cubit.isLoading,
                ),
            onPressed: context.read<RatingFormCubit>().save,
          ),
        ),
      ),
    );
  }
}
