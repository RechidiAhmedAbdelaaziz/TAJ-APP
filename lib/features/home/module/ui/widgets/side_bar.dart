part of '../home_screen.dart';

class _SideBar extends StatelessWidget {
  const _SideBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: 304.w,
        color: AppColors.white,

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _DrawerHeder(),

            heightSpace(28),

            ...{
              "About Us": () => context.to(AboutNavigator.aboutUs()),

              "Property Info":
                  () => context.to(RealStatesNavigator.states()),

              "Terms and conditions":
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
              "Contact Us":
                  () => context.to(AboutNavigator.contactUs()),

              "My Docs": () => context.to(DocumentsNavigator.docs()),

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
