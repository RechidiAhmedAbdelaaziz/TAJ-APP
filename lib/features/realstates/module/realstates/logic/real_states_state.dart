// ignore_for_file: library_private_types_in_public_api

part of 'real_states_cubit.dart';

enum _RealStatesStatus { initial, loading, success, failure }

class RealStatesState extends CubitErrorState {
  final PaginationResult<RealStateModel> _result;
  final RealStateModel? _selectedRealState;
  final _RealStatesStatus _status;

  RealStatesState({
    required PaginationResult<RealStateModel> result,
    _RealStatesStatus status = _RealStatesStatus.initial,
    RealStateModel? selectedRealState,
    String? error,
  }) : _result = result,
       _status = status,
       _selectedRealState = selectedRealState,
       super(error);

  factory RealStatesState.initial() =>
      RealStatesState(result: PaginationResult<RealStateModel>());

  bool get isLoading => _status == _RealStatesStatus.loading;

  RealStatesState _loading() =>
      _copyWith(status: _RealStatesStatus.loading);

  RealStatesState _loaded(PaginationResult<RealStateModel> result) =>
      _copyWith(
        status: _RealStatesStatus.success,
        result: _result.addAll(result),
      );

  RealStatesState _selectRealState(RealStateModel realState) =>
      _copyWith(
        selectedRealState: realState,
        status: _RealStatesStatus.success,
      );

  RealStatesState _error(String error) =>
      _copyWith(status: _RealStatesStatus.failure, error: error);

  RealStatesState _copyWith({
    PaginationResult<RealStateModel>? result,
    _RealStatesStatus? status,
    RealStateModel? selectedRealState,
    String? error,
  }) {
    return RealStatesState(
      result: result ?? _result,
      selectedRealState: selectedRealState ?? _selectedRealState,
      status: status ?? _status,
      error: error,
    );
  }
}
