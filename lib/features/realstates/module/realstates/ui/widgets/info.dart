part of '../real_states_screen.dart';

class _Info extends StatelessWidget {
  final RealStateModel realState;

  const _Info(this.realState);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5).r,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.25),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...{
            "Property Address:": realState.address,

            "Property Type:": realState.type,

            "Property Area:": "${realState.area} M",

            "Purchase Date:":
                realState.purshaseDate?.toDayMonthYear(),

            "Warranty Expiration Date:":
                realState.warrantyDate?.toDayMonthYear(),

            "Year Of Property Construction:":
                realState.constructionYear,
          }.entries.map(
            (e) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.key.tr(context),
                      style: AppTextStyles.medium,
                    ),
                    widthSpace(8),
                    Text(
                      e.value.toString(),
                      style: AppTextStyles.medium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                heightSpace(8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
