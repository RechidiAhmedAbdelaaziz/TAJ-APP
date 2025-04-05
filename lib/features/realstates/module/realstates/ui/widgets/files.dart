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
        PdfView.fromUrl(
          title: '${realState.name} $title',
          url: fileUrl ?? "",
        ),
      ],
    );
  }
}
