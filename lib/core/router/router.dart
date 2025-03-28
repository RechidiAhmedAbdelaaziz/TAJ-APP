import 'package:taj_elsafa/features/auth/configs/auth_navigator.dart';
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/intro/welcome_screen.dart';
import 'package:taj_elsafa/features/splashscreen/splash_screen.dart';
part 'routes.dart';
part 'navigator_base.dart';

class AppRouter {
  final routerConfig = GoRouter(
    initialLocation: '/', //TODO change to home
    routes: [...AuthNavigator.routes, 
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        name: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
    ],
    debugLogDiagnostics: true,

    redirect: _handelRedirect,
  );

  static FutureOr<String?> _handelRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    return null; //TODO remove after adding auth

    // if (AppRoutes._authPaths.any(
    //   (path) => state.matchedLocation.contains(path),
    // )) {
    //   return null;
    // }

    // if (await locator<AuthCubit>().isAuthenticated) {
    //   return null;
    // }

    // return '/login';
  }
}
