import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/auth/modules/forgotpassword/logic/forgot_password_cubit.dart';
import 'package:taj_elsafa/features/auth/modules/forgotpassword/ui/forgot_password_screen.dart';
import 'package:taj_elsafa/features/auth/modules/login/logic/login.cubit.dart';
import 'package:taj_elsafa/features/auth/modules/login/ui/login_screen.dart';

class AuthNavigator extends AppNavigatorBase {
  AuthNavigator.login() : super(path: AppRoutes.login);

  AuthNavigator.forgotPassword()
    : super(path: AppRoutes.forgetPassword);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => LoginCubit(),
          child: const LoginScreen(),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => ForgotPasswordCubit(),
          child: const ForgotPasswordScreen(),
        );
      },
    ),
  ];
}
