import 'package:flutter/material.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/handingover/modules/handingover/logic/handing_over_cubit.dart';
import 'package:taj_elsafa/features/handingover/modules/handingover/ui/handing_over_screen.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';

class HandingOverNavigator extends AppNavigatorBase {
  HandingOverNavigator() : super(path: AppRoutes.handingOver);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.handingOver,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HandingOverCubit()),

            BlocProvider(
              lazy: false,
              create: (context) {
                final cubit = RealStatesCubit()..getRealStates();

                cubit.selectedStateController.addListener(() {
                  print("Selected state: ${cubit.selectedRealState}");
                  final selectedState = cubit.selectedRealState!;
                  context
                      .read<HandingOverCubit>()
                      .getProjectCondition(selectedState);
                });

                return cubit;
              },
            ),
          ],
          child: const HandingOverScreen(),
        );
      },
    ),
  ];
}
