part of '../home_screen.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppLogo(height: kTextTabBarHeight),
      centerTitle: true,
      backgroundColor: AppColors.grey,
      leading: IconButton(
        icon: Icon(Icons.menu, size: 32.r),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [NotificationButton(), widthSpace(8)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
