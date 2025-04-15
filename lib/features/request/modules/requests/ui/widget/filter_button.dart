part of '../requests_screen.dart';

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => context.bottomSheetWithResult<String>(
            child: _Filter(),
            onResult: (status) {
              final cubit = context.read<RequestsCubit>();

              cubit.filter.status.setValue(status);
              cubit.getFilteredRequests();
            },
          ),
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

class _Filter extends StatelessWidget {
  _Filter();

  final statusFilters =
      {
        "Open": Color(0xff002AFF),
        "In Progress": Colors.orange,
        "Waiting For Confirmation": Color(0xff7C7C7C),
        "Completed": Color(0xff00FF00),
        "Rejected": Colors.red,
      }.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15).r,
        ),
        border: Border.all(color: AppColors.black),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 35.h,
        ),
        itemCount: statusFilters.length,

        itemBuilder: (context, index) {
          final filter = statusFilters[index];
          return InkWell(
            onTap: () => context.back(filter.key),
            child: Text(
              filter.key,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium.copyWith(
                color: filter.value,
              ),
            ),
          );
        },
        separatorBuilder:
            (_, _) => Divider(color: Color(0x26000000), height: 25.h),
      ),
    );
  }
}
