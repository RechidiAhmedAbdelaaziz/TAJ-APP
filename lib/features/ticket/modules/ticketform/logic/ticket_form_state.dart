// ignore_for_file: library_private_types_in_public_api

part of 'ticket_form_cubit.dart';

enum _TicketFormStatus { initial, loading, loaded, success, error }

class TicketFormState<T> extends CubitErrorState {
  final T? _dto;
  final _TicketFormStatus _status;

  TicketFormState({
    T? dto,
    _TicketFormStatus status = _TicketFormStatus.initial,
    String? error,
  }) : _status = status,
       _dto = dto,
       super(error);

  factory TicketFormState.initial() => TicketFormState();

  TicketFormState<T> _copyWith({
    T? dto,
    _TicketFormStatus? status,
    String? error,
  }) {
    return TicketFormState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  TicketFormState<T> _loading() =>
      _copyWith(status: _TicketFormStatus.loading);

  TicketFormState<T> _loaded(T dto) =>
      _copyWith(dto: _dto ?? dto, status: _TicketFormStatus.loaded);

  TicketFormState<T> _success(TicketModel model) =>
      _Success(model, _dto);

  TicketFormState<T> _error(String error) =>
      _copyWith(status: _TicketFormStatus.error, error: error);

  void onSuccess(void Function(TicketModel) onSuccess) {}
}

class _Success<T> extends TicketFormState<T> {
  final TicketModel model;

  _Success(this.model, T? dto)
    : super(dto: dto, status: _TicketFormStatus.success);

  @override
  void onSuccess(void Function(TicketModel) onSuccess) =>
      onSuccess(model);
}
