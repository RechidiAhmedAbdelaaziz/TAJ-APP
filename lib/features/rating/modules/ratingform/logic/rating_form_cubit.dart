import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/rating/data/dto/rating_dto.dart';
import 'package:taj_elsafa/features/rating/data/models/rating_model.dart';
import 'package:taj_elsafa/features/rating/data/repository/rating_repository.dart';

part 'rating_form_state.dart';

abstract class RatingFormCubit<T extends RatingDto>
    extends Cubit<RatingFormState<T>> {
  final _repo = locator<RatingRepo>();

  RatingFormCubit() : super(RatingFormState.initial());

  bool get isLoading => state._status == _RatingStatus.loading;
  bool get isLoaded => state._dto != null;

  T get dto => state._dto!;

  void load();

  void save();
}

class CreateRatingCubit extends RatingFormCubit<CreateRatingDto> {
  CreateRatingCubit() : super();

  @override
  void load() => emit(state._loaded(CreateRatingDto()));

  @override
  void save() async {
    emit(state._loading());

    await Future.delayed(
      const Duration(seconds: 2),
    ); //TODO implemnt api call

    emit(state._success(RatingModel(id: '1')));
  }
}
