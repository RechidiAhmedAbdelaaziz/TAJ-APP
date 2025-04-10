import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../modules/noteform/logic/note_form_cubit.dart';
import '../modules/noteform/ui/note_form_screen.dart';

class NotesNavigator extends AppNavigatorBase {
  NotesNavigator.create() : super(path: AppRoutes.createNote);

  static List<RouteBase> routes = [
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
