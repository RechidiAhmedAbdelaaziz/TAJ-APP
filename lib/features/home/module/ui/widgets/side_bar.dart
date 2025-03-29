part of '../home_screen.dart';

class _SideBar extends StatelessWidget {
  const _SideBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _DrawerHeder(),
            heightSpace(28),

            ...{
              "AboutUs".tr(context): () {},
              "PropertyInfo".tr(context): () {},
              "TermsAndConditions".tr(context): () {},
            }.entries.map(
              (e) => Column(
                children: [
                  _buildButton(text: e.key, onPressed: e.value),
                  heightSpace(35),
                ],
              ),
            ),

            _buildDivider(),
            heightSpace(35),

            ...{
              "ContactUs".tr(context): () {},
              "MyDocs".tr(context):
                  () => context.to(DocumentsNavigator.docs()),
              "Logout".tr(context): () {},
            }.entries.map(
              (e) => Column(
                children: [
                  _buildButton(text: e.key, onPressed: e.value),
                  heightSpace(35),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Stack(
        children: [
          SizedBox(
            width: 40.w,
            child: Divider(
              color: AppColors.greyDark,
              height: 1,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          widthSpace(32),
          Expanded(child: Text(text, style: AppTextStyles.normal)),
          widthSpace(20),
          SvgPicture.asset(Assets.icons.arrowRight),
          widthSpace(32),
        ],
      ),
    );
  }
}
