// ignore_for_file: library_private_types_in_public_api

part of 'requests_cubit.dart';

enum _RequestsStatus { initial, loading, loaded, error }

class RequestsState extends CubitErrorState {
  final PaginationResult<RequestModel>? _result;
  final RequestModel? _selectedRequest;
  final _RequestsStatus _status;

  RequestsState({
    PaginationResult<RequestModel>? result,
    RequestModel? selectedRequest,
    _RequestsStatus status = _RequestsStatus.initial,
    String? error,
  }) : _result = result,
       _selectedRequest = selectedRequest,
       _status = status,
       super(error);

  factory RequestsState.initial() => RequestsState();

  bool get isLoading => _status == _RequestsStatus.loading;

  RequestsState _copyWith({
    PaginationResult<RequestModel>? result,
    RequestModel? selectedRequest,
    _RequestsStatus? status,
    String? error,
  }) {
    return RequestsState(
      result: result ?? _result,
      status: status ?? _status,
      selectedRequest: selectedRequest ?? _selectedRequest,
      error: error,
    );
  }

  RequestsState _loading() =>
      _copyWith(status: _RequestsStatus.loading);

  RequestsState _loaded(PaginationResult<RequestModel> result) =>
      _copyWith(
        result: _result?.addAll(result) ?? result,
        status: _RequestsStatus.loaded,
      );

  RequestsState _selectRequest(RequestModel request) => _copyWith(
    selectedRequest: request,
    status: _RequestsStatus.loaded,
  );

  RequestsState _error(String error) =>
      _copyWith(status: _RequestsStatus.error, error: error);
}
