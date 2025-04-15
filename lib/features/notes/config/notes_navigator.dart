import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';

import '../modules/noteform/logic/note_form_cubit.dart';
import '../modules/noteform/ui/note_form_screen.dart';
import '../modules/notes/logic/notes_cubit.dart';
import '../modules/notes/ui/notes_screen.dart';

class NotesNavigator extends AppNavigatorBase {
  NotesNavigator.notes([RequestModel? request])
    : super(
        path: AppRoutes.notes,
        pathParams: {'requestId': request?.id ?? '1'},
      );

  NotesNavigator.create() : super(path: AppRoutes.createNote);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.notes,
      builder: (context, state) {
        return BlocProvider(
          create:
              (context) =>
                  NotesCubit(state.pathParameters['requestId']!)
                    ..getNotes(),
          child: const NotesScreen(),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.createNote,
      builder: (context, state) {
        return BlocProvider<NoteFormCubit>(
          create: (context) => CreateNoteCubit()..init(),
          child: const NoteFormScreen(),
        );
      },
    ),
  ];
}
