// ignore_for_file: library_private_types_in_public_api

part of 'rating_form_cubit.dart';

enum _RatingStatus { initial, loading, loaded, success, error }

class RatingFormState<T> extends CubitErrorState {
  final T? _dto;
  final _RatingStatus _status;

  RatingFormState({
    T? dto,
    _RatingStatus status = _RatingStatus.initial,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  factory RatingFormState.initial() => RatingFormState();

  RatingFormState<T> _copyWith({
    T? dto,
    _RatingStatus? status,
    String? error,
  }) {
    return RatingFormState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  RatingFormState<T> _loading() {
    return _copyWith(status: _RatingStatus.loading);
  }

  RatingFormState<T> _loaded(T dto) {
    return _copyWith(status: _RatingStatus.loaded, dto: dto);
  }

  RatingFormState<T> _success(RatingModel model) {
    return _Success(model, dto: _dto);
  }

  RatingFormState<T> _error(String error) {
    return _copyWith(status: _RatingStatus.error, error: error);
  }

  void onSuccess(ValueChanged<RatingModel> onSuccess) {}
}

class _Success<T> extends RatingFormState<T> {
  final RatingModel model;

  _Success(this.model, {super.dto});

  @override
  void onSuccess(ValueChanged<RatingModel> onSuccess) =>
      onSuccess(model);
}
