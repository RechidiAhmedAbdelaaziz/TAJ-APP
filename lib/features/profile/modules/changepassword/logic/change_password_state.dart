// ignore_for_file: library_private_types_in_public_api

part of 'change_password_cubit.dart';

enum _ChangePasswordStatus { initial, loading, success, error }

class ChangePasswordState extends CubitErrorState {
  final _ChangePasswordStatus _status;

  ChangePasswordState({_ChangePasswordStatus? status, String? error})
    : _status = status ?? _ChangePasswordStatus.initial,
      super(error);

  factory ChangePasswordState.initial() => ChangePasswordState();

  bool get isLoading => _status == _ChangePasswordStatus.loading;

  ChangePasswordState _copyWith({
    _ChangePasswordStatus? status,
    String? error,
  }) {
    return ChangePasswordState(
      status: status ?? _status,
      error: error,
    );
  }

  ChangePasswordState _loading() =>
      _copyWith(status: _ChangePasswordStatus.loading);

  ChangePasswordState _success() =>
      _copyWith(status: _ChangePasswordStatus.success);

  ChangePasswordState _error(String error) =>
      _copyWith(status: _ChangePasswordStatus.error, error: error);

  void onSuccess(VoidCallback callback) {
    if (_status == _ChangePasswordStatus.success) {
      callback();
    }
  }
}
