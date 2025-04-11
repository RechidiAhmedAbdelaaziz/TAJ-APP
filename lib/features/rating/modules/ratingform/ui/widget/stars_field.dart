part of '../rating_form_screen.dart';

class _StarsRating extends StatelessWidget {
  const _StarsRating();

  @override
  Widget build(BuildContext context) {
    final controller =
        context.read<RatingFormCubit>().dto.ratingController;
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, rating, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            for (int i = 1; i <= 5; i++)
              InkWell(
                onTap: () => controller.setValue(i),
                child: Icon(
                  Icons.star,
                  color: i <= rating ? Colors.green : AppColors.grey,
                  size: 45.r,
                ),
              ),
          ],
        );
      },
    );
  }
}
