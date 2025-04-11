part of '../rating_form_screen.dart';


class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RatingFormCubit>();
    final dto = cubit.dto;
    return Container(
      width: 372.w,

      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 45.h),
      decoration: BoxDecoration(
        color: Color(0xffFAF7FF),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Service Evaluation',
            style: AppTextStyles.medium.copyWith(
              color: AppColors.black,
            ),
          ),
          heightSpace(20),

          _StarsRating(),
          heightSpace(20),

          AppInputField(
            controller: dto.feedbackController,
            hintText: 'Write your feedback ...',
            fillColor: AppColors.buttonColor,
            maxLines: 5,
            hintColor: AppColors.white.withAlpha(150),
            textColor: AppColors.white,
            withShadow: false,
            borderRadius: 0,
          ),
        ],
      ),
    );
  }
}
