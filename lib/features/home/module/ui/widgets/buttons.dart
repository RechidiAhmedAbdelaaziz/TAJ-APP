part of '../home_screen.dart';

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        spacing: 10.h,
        children: [
          _buildButton(
            text: 'MyTickets'.tr(context),
            onPressed: () {},
          ),
          _buildButton(
            text: 'MyRequest'.tr(context),
            onPressed: () {},
          ),
          _buildButton(
            text: 'HandingOver'.tr(context),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return AppButton.primary(text: text, onPressed: onPressed);
  }
}
