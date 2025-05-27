// ignore_for_file: library_private_types_in_public_api

part of 'tickets_cubit.dart';

enum _TicketsStatus { initial, loading, loaded, error }

class TicketsState extends CubitErrorState {
  final PaginationResult<TicketModel>? _result;
  final TicketModel? _selectedTicket;
  final _TicketsStatus _status;

  TicketsState({
    PaginationResult<TicketModel>? result,
    TicketModel? selectedTicket,
    _TicketsStatus status = _TicketsStatus.initial,
    String? error,
  }) : _result = result,
       _selectedTicket = selectedTicket,
       _status = status,
       super(error);

  factory TicketsState.initial() => TicketsState();

  bool get isLoading => _status == _TicketsStatus.loading;

  TicketsState _copyWith({
    PaginationResult<TicketModel>? result,
    TicketModel? selectedTicket,
    _TicketsStatus? status,
    String? error,
  }) {
    return TicketsState(
      result: result ?? _result,
      status: status ?? _status,
      selectedTicket: selectedTicket ?? _selectedTicket,
      error: error,
    );
  }

  TicketsState _loading() =>
      _copyWith(status: _TicketsStatus.loading);

  TicketsState _loaded(PaginationResult<TicketModel> result) =>
      _copyWith(
        result: _result?.addAll(result) ?? result,
        status: _TicketsStatus.loaded,
      );

  TicketsState _addTicket(TicketModel ticket) =>
      _copyWith(
        result: _result?.add(ticket) ?? PaginationResult(data: [ticket]),
        status: _TicketsStatus.loaded,
      );

  TicketsState _error(String error) =>
      _copyWith(status: _TicketsStatus.error, error: error);
}
