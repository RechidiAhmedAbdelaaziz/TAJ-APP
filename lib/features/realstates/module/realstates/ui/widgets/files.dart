part of '../real_states_screen.dart';

class _Files extends StatelessWidget {
  final RealStateModel realState;
  const _Files(this.realState);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _buildFileInfo("Plans", realState.plansFileUrl),
          heightSpace(25),
          _buildFileInfo(
            "Profiles And Presentations",
            realState.profileFileUrl,
          ),
        ],
      ),
    );
  }

  Widget _buildFileInfo(String title, String? fileUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.medium),
        heightSpace(8),
        FileDownloader(
          url: fileUrl ?? "",
          fileName: fileUrl?.split("/").last ?? "",
          builder: (context, isDownloading) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.greyDark,
                borderRadius: BorderRadius.circular(5).r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.w,
                children: [
                  isDownloading
                      ? CircularProgressIndicator(
                        color: AppColors.white,
                        constraints: BoxConstraints(
                          minHeight: 20.h,
                          minWidth: 20.h,
                        ),
                      )
                      : SvgPicture.asset(Assets.icons.pdfIcon),

                  Text(
                    'Download File',
                    style: AppTextStyles.normal.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
