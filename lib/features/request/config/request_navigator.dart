import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';

import '../modules/requests/logic/requests_cubit.dart';
import '../modules/requests/ui/requests_screen.dart';

class RequestNavigator extends AppNavigatorBase {
  RequestNavigator.myRequests() : super(path: AppRoutes.myRequests);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.myRequests,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RealStatesCubit()..getRealStates(),
            ),
            BlocProvider(
              create:
                  (context) =>
                      RequestsCubit()
                        ..getRequests(), //TODO change to get filtered requests by state
            ),
          ],
          child: const RequestsScreen(),
        );
      },
    ),
  ];
}
