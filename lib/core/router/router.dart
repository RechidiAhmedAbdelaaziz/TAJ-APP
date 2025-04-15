import 'package:taj_elsafa/features/handingover/config/handing_over_navigator.dart';
import 'package:taj_elsafa/features/rating/config/rating_navigator.dart';
import 'package:taj_elsafa/features/notes/config/notes_navigator.dart';
import 'package:taj_elsafa/features/request/config/request_navigator.dart';
import 'package:taj_elsafa/features/realstates/config/real_states_navigator.dart';
import 'package:taj_elsafa/features/about/config/about_us_navigator.dart';
import 'package:taj_elsafa/features/documents/config/documents_navigator.dart';
import 'package:taj_elsafa/features/notification/config/notification_navigator.dart';
import 'package:taj_elsafa/features/profile/config/profile_navigator.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/features/auth/logic/auth.cubit.dart';
import 'package:taj_elsafa/features/home/config/home_navigator.dart';
import 'package:taj_elsafa/features/auth/configs/auth_navigator.dart';
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/intro/welcome_screen.dart';
import 'package:taj_elsafa/features/splashscreen/splash_screen.dart';
import 'package:taj_elsafa/features/ticket/config/ticket_navigator.dart';
part 'routes.dart';
part 'navigator_base.dart';

class AppRouter {
  final routerConfig = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [...HandingOverNavigator.routes, 
      ...RatingNavigator.routes,
      ...NotesNavigator.routes,
      ...RequestNavigator.routes,
      ...RealStatesNavigator.routes,
      ...AboutNavigator.routes,
      ...DocumentsNavigator.routes,
      ...NotificationNavigator.routes,
      ...ProfileNavigator.routes,
      ...HomeNavigator.routes,
      ...AuthNavigator.routes,
      ...TicketNavigator.routes,

      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.welcome,
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
    // ignore: no_leading_underscores_for_local_identifiers
    bool _is(String path) => state.matchedLocation == path;

    // splash screen
    if (_is(AppRoutes.splash)) return null;

    //Auth routes
    if (AppRoutes._authPaths.any(_is)) return null;

    final isAuthenticated =
        await locator<AuthCubit>().isAuthenticated;

    // welcome screen (if user is not authenticated)
    if (_is(AppRoutes.welcome)) {
      return isAuthenticated ? AppRoutes.home : null;
    }

    return null;
  }
}
