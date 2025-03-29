import 'package:flutter/material.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/documents/modules/documents/logic/documents_cubit.dart';
import 'package:taj_elsafa/features/documents/modules/documents/ui/documents_screen.dart';

class DocumentsNavigator extends AppNavigatorBase {
  DocumentsNavigator.docs() : super(path: AppRoutes.documents);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.documents,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => DocumentsCubit(),
          child: const DocumentsScreen(),
        );
      },
    ),
  ];
}
