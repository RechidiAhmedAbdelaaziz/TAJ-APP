part of '../requests_screen.dart';

class _QrCode extends StatelessWidget {
  final String qrCode;
  const _QrCode(this.qrCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: BoxDecoration(color: Color(0xffFAF7FF)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              heightSpace(44),
              Text(
                'Scan QR Code',
                style: AppTextStyles.medium.copyWith(
                  color: AppColors.black,
                ),
              ),
              heightSpace(40),
              Image(
                image: NetworkImage(qrCode),
                width: 180.r,
                height: 180.r,
                fit: BoxFit.contain,
              ),
              heightSpace(40),
              _shareButton(context),
              heightSpace(44),
            ],
          ),
          _closeButton(context),
        ],
      ),
    );
  }

  Widget _shareButton(BuildContext context) {
    return InkWell(
      onTap: () async => await Share.share(qrCode),
      child: Container(
        width: 300.w,
        padding: EdgeInsets.symmetric(vertical: 8.h),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5).r,
          border: Border.all(color: AppColors.black),
        ),
        child: Center(
          child: Text(
            'Share',
            style: AppTextStyles.normal.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _closeButton(BuildContext context) {
    return PositionedDirectional(
      top: 20.h,
      start: 20.w,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.close, size: 35.r, color: AppColors.black),
      ),
    );
  }
}
