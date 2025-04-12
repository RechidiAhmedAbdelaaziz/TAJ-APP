import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';
import 'package:taj_elsafa/features/ticket/modules/ticketform/logic/ticket_form_cubit.dart';
import 'package:taj_elsafa/features/ticket/modules/ticketform/ui/ticket_form_screen.dart';

import '../modules/tickets/logic/tickets_cubit.dart';
import '../modules/tickets/ui/tickets_screen.dart';

class TicketNavigator extends AppNavigatorBase {
  TicketNavigator.myTickets() : super(path: AppRoutes.myTickets);

  TicketNavigator.createTicket()
    : super(path: AppRoutes.createTicket);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.createTicket,
      builder: (context, state) {
        return BlocProvider<TicketFormCubit>(
          create: (context) => CreateTicketCubit()..init(),
          child: const TicketFormScreen(),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.myTickets,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) =>
                      RealStatesCubit()..getRealStatesWarranty(),
            ),
            BlocProvider(
              create: (context) {
                final cubit = TicketsCubit();
                final stateCubit = context.read<RealStatesCubit>();

                stateCubit.selectedStateController.addListener(() {
                  cubit.filter.stateController.setValue(
                    stateCubit.selectedStateController.value!,
                  );
                  cubit.getFilteredTickets();
                });

                return cubit;
              },
            ),
          ],
          child: const TicketsScreen(),
        );
      },
    ),
  ];
}
