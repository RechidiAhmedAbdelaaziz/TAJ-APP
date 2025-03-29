part of '../home_screen.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppLogo(),
      centerTitle: true,
      backgroundColor: AppColors.grey,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        // NotificationButton() //TODO : Uncomment when NotificationButton is implemented (in notifications feature)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
