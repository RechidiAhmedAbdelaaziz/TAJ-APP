import 'package:taj_elsafa/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/features/rating/modules/ratingform/logic/rating_form_cubit.dart';
import 'package:taj_elsafa/features/rating/modules/ratingform/ui/rating_form_screen.dart';

class RatingNavigator extends AppNavigatorBase {
  RatingNavigator.create() : super(path: AppRoutes.createRating);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.createRating,
      builder: (context, state) {
        return BlocProvider<RatingFormCubit>(
          create: (context) => CreateRatingCubit()..load(),
          child: const RatingFormScreen(),
        );
      },
    ),
  ];
}
