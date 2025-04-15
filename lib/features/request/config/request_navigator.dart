import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';
import 'package:taj_elsafa/features/request/modules/requestform/logic/request_form_cubit.dart';
import 'package:taj_elsafa/features/request/modules/requestform/ui/request_form_screen.dart';

import '../modules/requests/logic/requests_cubit.dart';
import '../modules/requests/ui/requests_screen.dart';

class RequestNavigator extends AppNavigatorBase {
  RequestNavigator.myRequests() : super(path: AppRoutes.myRequests);

  RequestNavigator.createRequest()
    : super(path: AppRoutes.createRequest);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.createRequest,
      builder: (context, state) {
        return BlocProvider<RequestFormCubit>(
          create: (context) => CreateRequestCubit()..init(),
          child: const RequestFormScreen(),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.myRequests,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RealStatesCubit()..getRealStates(),
            ),
            BlocProvider(
              create: (context) {
                final cubit = RequestsCubit();

                final stateCubit = context.read<RealStatesCubit>();

                stateCubit.selectedStateController.addListener(() {
                  cubit.filter.stateController.setValue(
                    stateCubit.selectedStateController.value!,
                  );
                  cubit.getFilteredRequests();
                });

                return cubit;
              },
            ),
          ],
          child: const RequestsScreen(),
        );
      },
    ),
  ];
}
