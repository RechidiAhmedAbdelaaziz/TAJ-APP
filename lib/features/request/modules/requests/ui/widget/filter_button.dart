part of '../requests_screen.dart';

class _FilterButton extends StatelessWidget {
  const _FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, //TODO: implement filter action
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8.w,
        children: [
          SvgPicture.asset(Assets.icons.filter),
          Text(
            'Filter'.tr(context),
            style: AppTextStyles.medium.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
