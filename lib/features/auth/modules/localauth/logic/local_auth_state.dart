// ignore_for_file: library_private_types_in_public_api

part of 'local_auth_cubit.dart';

enum _LocalAuthStatus { initial, loading, success, error }

class LocalAuthState extends CubitErrorState {
  final _LocalAuthStatus _status;

  LocalAuthState({
    _LocalAuthStatus status = _LocalAuthStatus.initial,
    String? error,
  }) : _status = status,
       super(error);

  factory LocalAuthState.initial() => LocalAuthState();

  bool get isLoading => _status == _LocalAuthStatus.loading;
  bool get isSuccess => _status == _LocalAuthStatus.success;

  LocalAuthState _loading() =>
      _copyWith(status: _LocalAuthStatus.loading);

  LocalAuthState _success() =>
      _copyWith(status: _LocalAuthStatus.success);

  LocalAuthState _error(String error) =>
      _copyWith(status: _LocalAuthStatus.error, error: error);

  LocalAuthState _copyWith({
    _LocalAuthStatus? status,
    String? error,
  }) {
    return LocalAuthState(status: status ?? _status, error: error);
  }

  void onSuccess(void Function() onSuccess) {
    if (isSuccess) onSuccess();
  }
}
