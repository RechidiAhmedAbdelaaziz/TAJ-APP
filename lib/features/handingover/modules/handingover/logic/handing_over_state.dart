// ignore_for_file: library_private_types_in_public_api

part of 'handing_over_cubit.dart';

enum _HandingOverStatus { initial, loading, loaded, error }

class HandingOverState extends CubitErrorState {
  final HandingOverModel? _result;
  final _HandingOverStatus _status;

  HandingOverState({
    HandingOverModel? result,
    _HandingOverStatus status = _HandingOverStatus.initial,
    String? error,
  }) : _result = result,
       _status = status,
       super(error);

  factory HandingOverState.initial() => HandingOverState();

  HandingOverState _copyWith({
    HandingOverModel? result,
    _HandingOverStatus? status,
    String? error,
  }) {
    return HandingOverState(
      result: result ?? _result,
      status: status ?? _status,
      error: error,
    );
  }

  HandingOverState _loading() {
    return _copyWith(status: _HandingOverStatus.loading);
  }

  HandingOverState _loaded(HandingOverModel result) {
    return _copyWith(
      result: result,
      status: _HandingOverStatus.loaded,
    );
  }

  HandingOverState _error(String error) {
    return _copyWith(error: error, status: _HandingOverStatus.error);
  }
}
