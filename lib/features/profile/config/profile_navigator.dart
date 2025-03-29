import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/profile/modules/changepassword/logic/change_password_cubit.dart';
import 'package:taj_elsafa/features/profile/modules/changepassword/ui/change_password_screen.dart';
import 'package:taj_elsafa/features/profile/modules/editprofile/logic/edit_profile_cubit.dart';
import 'package:taj_elsafa/features/profile/modules/editprofile/ui/edit_profile_screen.dart';

class ProfileNavigator extends AppNavigatorBase {
  ProfileNavigator.editProfile() : super(path: AppRoutes.editProfile);

  ProfileNavigator.changePassword()
    : super(path: AppRoutes.changePassword);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.editProfile,
      builder: (context, state) {
        return BlocProvider(
          create:
              (context) =>
                  EditProfileCubit(), //TODO : call loadDto to get user data
          child: const EditProfileScreen(),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.changePassword,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ChangePasswordCubit(),
          child: const ChangePasswordScreen(),
        );
      },
    ),
  ];
}
