import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/ui/real_states_screen.dart';

class RealStatesNavigator extends AppNavigatorBase {
  RealStatesNavigator.states() : super(path: AppRoutes.realStates);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.realStates,
      builder: (context, state) {
        return BlocProvider(
          lazy: false,
          create: (context) => RealStatesCubit()..getRealStates(),
          child: const RealStatesScreen(),
        );
      },
    ),
  ];
}
