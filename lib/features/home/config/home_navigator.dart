import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/home/module/logic/home_cubit.dart';
import 'package:taj_elsafa/features/home/module/ui/home_screen.dart';

class HomeNavigator extends AppNavigatorBase {
  HomeNavigator() : super(path: AppRoutes.home);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return BlocProvider(
          create:
              (context) =>
                  HomeCubit(), //TODO call fetchBanners after implementing the repository
          child: const HomeScreen(),
        );
      },
    ),
  ];
}
