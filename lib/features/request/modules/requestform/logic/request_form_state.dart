// ignore_for_file: library_private_types_in_public_api

part of 'request_form_cubit.dart';

enum _RequestFormStatus { initial, loading, loaded, success, error }

class RequestFormState<T> extends CubitErrorState {
  final T? _dto;
  final _RequestFormStatus _status;

  RequestFormState({
    T? dto,
    _RequestFormStatus status = _RequestFormStatus.initial,
    String? error,
  }) : _status = status,
       _dto = dto,
       super(error);

  factory RequestFormState.initial() => RequestFormState();

  RequestFormState<T> _copyWith({
    T? dto,
    _RequestFormStatus? status,
    String? error,
  }) {
    return RequestFormState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  RequestFormState<T> _loading() =>
      _copyWith(status: _RequestFormStatus.loading);

  RequestFormState<T> _loaded(T dto) =>
      _copyWith(dto: _dto ?? dto, status: _RequestFormStatus.loaded);

  RequestFormState<T> _success(RequestModel model) =>
      _Success(model, _dto);

  RequestFormState<T> _error(String error) =>
      _copyWith(status: _RequestFormStatus.error, error: error);

  void onSuccess(void Function(RequestModel) onSuccess) {}
}

class _Success<T> extends RequestFormState<T> {
  final RequestModel model;

  _Success(this.model, T? dto)
    : super(dto: dto, status: _RequestFormStatus.success);

  @override
  void onSuccess(void Function(RequestModel) onSuccess) =>
      onSuccess(model);
}
