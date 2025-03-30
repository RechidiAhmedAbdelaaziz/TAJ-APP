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
              "AboutUs": () => context.to(AboutNavigator.aboutUs()),

              "PropertyInfo":
                  () => context.to(RealStatesNavigator.states()),

              "TermsAndConditions":
                  () =>
                      context.to(AboutNavigator.termsAndConditions()),
            }.entries.map(
              (e) => Column(
                children: [
                  _buildButton(
                    text: e.key.tr(context),
                    onPressed: e.value,
                  ),
                  heightSpace(35),
                ],
              ),
            ),

            _buildDivider(),
            heightSpace(35),

            ...{
              "ContactUs":
                  () => context.to(AboutNavigator.contactUs()),

              "MyDocs": () => context.to(DocumentsNavigator.docs()),

              "Logout": () => locator<AuthCubit>().logout(),
            }.entries.map(
              (e) => Column(
                children: [
                  _buildButton(
                    text: e.key.tr(context),
                    onPressed: e.value,
                  ),
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
